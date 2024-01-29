import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'MapsNavigation.dart';

class DriverNavigation extends StatefulWidget {
  const DriverNavigation({super.key});

  @override
  State<DriverNavigation> createState() => _DriverNavigationState();
}

class _DriverNavigationState extends State<DriverNavigation> {
  TextEditingController latController = TextEditingController();
  TextEditingController lngController = TextEditingController();
  late LatLng dustbinLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Driver Navigation',
            style: GoogleFonts.bebasNeue(
              fontSize: 25,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter Truck Location',
              style: GoogleFonts.bebasNeue(
                fontSize: 30,
                color: const Color.fromARGB(255, 250, 250, 250),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: latController,
              decoration: const InputDecoration(
                hintText: 'Latitude',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 242, 244, 242),
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF1565C0),
                    width: 2.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              cursorColor: const Color.fromARGB(210, 139, 28, 28),
              controller: lngController,
              decoration: const InputDecoration(
                hintText: 'Longitude',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 239, 239, 239),
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF1565C0),
                    width: 2.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF1565C0),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                textStyle: GoogleFonts.bebasNeue(
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NavigationScreen(
                      double.parse(latController.text),
                      double.parse(lngController.text),
                      latitude: 1,
                      longitude: 1,
                    ),
                  ),
                );
              },
              child: const Text(
                'Navigate',
                selectionColor: Color.fromARGB(255, 225, 236, 226),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}