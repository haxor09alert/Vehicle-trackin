import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class VehicleTracking2 extends StatefulWidget {
  const VehicleTracking2({super.key});

  @override
  State<VehicleTracking2> createState() => _VehicleTracking2State();
}

class _VehicleTracking2State extends State<VehicleTracking2> {
  late LatLng _currentPosition;
  final Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.33500926, -122.03272188),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.33500926, -122.03272188),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position position;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        return;
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return;
      }
    }

    position = await Geolocator.getCurrentPosition();

    _currentPosition = LatLng(position.latitude, position.longitude);

    _kGooglePlex = CameraPosition(
      target: _currentPosition,
      zoom: 14.4746,
    );

    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          markers: <Marker>{_setMarker()},
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToTheLake,
          label: const Text('To the lake!'),
          icon: const Icon(Icons.directions_boat),
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  Marker _setMarker() {
    LatLng singaDurbarPosition =
        const LatLng(27.69803150917992, 85.32388744895596);
    const double hueRed = 0.0;
    const double hueOrange = 30.0;
    const double hueGreen = 120.0;
    const double hueCyan = 180.0;
    const double hueAzure = 210.0;
    const double hueBlue = 240.0;
    const double hueViolet = 270.0;
    const double hueMagenta = 300.0;
    const double hueRose = 330.0;
    const double hueYellow = 60.0;
    return Marker(
        markerId: const MarkerId("softwarica_branch"),
        icon: BitmapDescriptor.defaultMarkerWithHue(hueGreen),
        position: _currentPosition);
  }
}
