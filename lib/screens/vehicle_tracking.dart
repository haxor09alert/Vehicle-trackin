

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_mao/core/constants/constants.dart';
import 'package:google_mao/features/widgets/responsive_text.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VehicleTrackingPage extends StatefulWidget {
  const VehicleTrackingPage({Key? key}) : super(key: key);

  @override
  State<VehicleTrackingPage> createState() => VehicleTrackingPageState();
}

class VehicleTrackingPageState extends State<VehicleTrackingPage> {
  late LatLng _currentPosition;
  // final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);

  List<LatLng>polylineCoordinates = [];

  void getPolyPoints()async{
    PolylinePoints polylinePoints =PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(sourceLocation.latitude,sourceLocation.longitude),
      PointLatLng(destination.latitude,destination.longitude),
    );

    if (result.points.isNotEmpty){
      var point;
      result.points.forEach((PointLatLng points) => polylineCoordinates.add(
        LatLng(point.latitude, point.longitude),
        ),
      );
    }
  }

  @override
  void initState(){
    getPolyPoints();
    getCurrentLocat();
    // TODO : implement initstate
    super.initState();
  }
   CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.33500926, -122.03272188),
    zoom: 14.4746,
  );
  Future<void> getCurrentLocat() async {
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
    return Scaffold(
      appBar: AppBar(
        title:  Center(
          child: ResponsiveText(
            "Vehicle Track",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              ),
            ),
        ),
        ),
        body: GoogleMap(initialCameraPosition: _kGooglePlex,
        markers:{
        const Marker(
          markerId: MarkerId("source"),
          position: sourceLocation,
          ),
        Marker(
          markerId: MarkerId("source"),
          position: destination,
          ),
        }
      )
    );
  }
}
