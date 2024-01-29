import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_mao/features/widgets/responsive_text.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_mao/core/constants/constants.dart';

class VehicleTracking2 extends StatefulWidget {
  const VehicleTracking2({super.key});

  @override
  State<VehicleTracking2> createState() => _VehicleTracking2State();
}

class _VehicleTracking2State extends State<VehicleTracking2> {
  late LatLng _currentPosition;
  final Completer<GoogleMapController> _controller = Completer();


  List<LatLng>polylineCoordinates = [];

  static const LatLng sourceLocation = LatLng(27.706309352808187, 85.33000065471418);
  static const LatLng destination = LatLng(27.719982708219845, 85.31878219897762);

  void getPolyPoints()async{
    PolylinePoints polylinePoints =PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyD45D5JWv9RzDd2y4Hh2eGEDEq2BRpKCrM',
      PointLatLng(sourceLocation.latitude,sourceLocation.longitude),
      PointLatLng(destination.latitude,destination.longitude),
    );

    print("RESULT ${result.errorMessage}");
    print("RESULT ${result.status}");
    List<LatLng> data = [
      LatLng(27.70511517928815, 85.3291366168589),
      LatLng(27.70568873516667, 85.3297037081462),
      LatLng(27.70609379655214, 85.33000936073832),
      LatLng(27.706398442569697, 85.3302592653734),
      LatLng(27.70688636761964, 85.33062592441175),
      LatLng(27.707238665126628, 85.33092773231718),
      LatLng(27.707500760118467, 85.33133719145003),
      LatLng(27.707861565181105, 85.33145253205083),
      LatLng(27.708135124276826, 85.33158543080665)
    ];
    if (data.isNotEmpty){
      data.forEach((LatLng points) {
        polylineCoordinates.add(points
        );
      }
      );
    }

    print(polylineCoordinates.length);
    setState(() {
      
    });
  }

  CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(27.706309352808187, 85.33000065471418),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(27.706309352808187, 85.33000065471418),
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
          polylines: Set.of([
            Polyline(
                  polylineId: PolylineId("test"),
                  color: Colors.blue,
                  points: polylineCoordinates,
                  width: 4,
            )
          ]),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _track_vehicle,
          label: const ResponsiveText('Track Vehicle'),
          icon: const Icon(Icons.directions),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> _track_vehicle() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
    getPolyPoints();

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
