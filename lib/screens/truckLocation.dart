// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_mao/screens/MapsNavigation.dart';
import 'package:google_mao/screens/TruckTracking.dart';
import 'package:lat_lon_grid_plugin/lat_lon_grid_plugin.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class DustbinSeggregation extends StatefulWidget {
  const DustbinSeggregation({Key? key}) : super(key: key);
  @override
  State<DustbinSeggregation> createState() => DustbinSeggregationState();
}

class DustbinSeggregationState extends State<DustbinSeggregation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  LocationData? _locationData;

  Future<List<Map<String, dynamic>>> tablefetchData() async {
    final response = await http
        .get(Uri.parse('https://longsageapple59.conveyor.cloud/GetDustbin'));
    if (response.statusCode == 200) {
      final decoded = json.decode(response.body) as List<dynamic>;
      return decoded
          .map((tabledata) => {
                'Truck_id': tabledata['Truck_id'],
                'Truck_address': tabledata['Truck_Address'],
                'Truck_longitude': tabledata['truck_Longitude'],
                'Truck_latitude': tabledata['Truck_Latitude'],
                'Truckstatus': tabledata['Truckstatus']
              })
          .toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
    tablefetchData();
    _animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        title: Text(
          "Truck Location",
          style: GoogleFonts.bebasNeue(
            fontSize: 25,
          ),
        ),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: _locationData != null
              ? LatLng(_locationData!.latitude!, _locationData!.longitude!)
              : LatLng(27.7077, 85.3252),
          zoom: 15.90,
          rotation: 0.0,
        ),
        children: [
          TileLayer(
            urlTemplate:
                // dark mode
                //  https://api.mapbox.com/styles/v1/mapbox/dark-v10/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicmlzaGFiaDAwNyIsImEiOiJjbGIzdW1jZzgwaHN5M25vMGlvbDV1MGpkIn0.5b7dKdZlv1Cssc8t1RZk9g
                'https://api.mapbox.com/styles/v1/rishabh007/cld1y64a2000i01syvo469kje/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicmlzaGFiaDAwNyIsImEiOiJjbGJiMjM5dHEwNDQyM3d1cGZ1bHE0dTEwIn0.Cj0ByZlzzqhu43sH-DHPRA',
            additionalOptions: const {
              'acessToken':
                  'pk.eyJ1IjoicmlzaGFiaDAwNyIsImEiOiJjbGJiMjM5dHEwNDQyM3d1cGZ1bHE0dTEwIn0.Cj0ByZlzzqhu43sH-DHPRA',
              'id': 'mapbox.mapbox-streets-v8',
            },
          ),
          LatLonGridLayer(
            options: LatLonGridLayerOptions(
              lineWidth: 0.5,
              lineColor: const Color.fromARGB(100, 0, 0, 0),
              labelStyle: const TextStyle(
                color: Colors.white,
                backgroundColor: Colors.black,
                fontSize: 12.0,
              ),
              showCardinalDirections: true,
              showCardinalDirectionsAsPrefix: false,
              showLabels: true,
              rotateLonLabels: true,
              placeLabelsOnLines: true,
              offsetLonLabelsBottom: 20.0,
              offsetLatLabelsLeft: 20.0,
            ),
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 50.0,
                height: 50.0,
                point: LatLng(27.7077, 85.3252),
                builder: (ctx) => GestureDetector(
                    onTap: () async {
                      try {
                        final data = await tablefetchData();
                        final latitude = data[0]['Truck_latitude'];
                        final longitude = data[0]['Truck_longitude'];
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('GpsTruck'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Truck ID: ${data[0]['Truck_id']}'),
                                Text(
                                    'Lat and Lng: ${data[0]['Truck_latitude']}, ${data[0]['Truck_longitude']}'),
                                Text('Status: ${data[0]['Truckstatus']}'),
                                ElevatedButton(
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NavigationScreen(
                                        double.parse(latitude.toString()),
                                        double.parse(longitude.toString()),
                                        latitude: 1,
                                        longitude: 1,
                                      ),
                                    ),
                                  ),
                                  child: const Text('Navigate'),
                                ),
                              ],
                            ),
                          ),
                        );
                      } catch (e) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Error'),
                            content: Text('Failed to load data from API: $e'),
                          ),
                        );
                      }
                    },
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (BuildContext context, Widget? child) {
                        return Opacity(
                          opacity: _opacityAnimation.value,
                          child: SvgPicture.asset(
                            'images/waste-basket.svg',
                            height: 50.0,
                            width: 50.0,
                          ),
                        );
                      },
                    )),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const DriverNavigation())),
            child: const Text('Driver Navigation')
          )
        ],
      ),
    );
  }
}