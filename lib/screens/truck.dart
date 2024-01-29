//import the library and Classes
// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

// creating a classname called ViewDustbinsScreen
class ViewDustbinsScreen extends StatefulWidget {
  const ViewDustbinsScreen({super.key});

  @override
  _ViewDustbinsScreenState createState() => _ViewDustbinsScreenState();
}

class _ViewDustbinsScreenState extends State<ViewDustbinsScreen> {
  List<dynamic> dustbins = [];

  Future<void> _getDustbins() async {
    // fetching the data of the dustbin through an API
    final url = Uri.parse('https://longsageapple59.conveyor.cloud/GetDustbin');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        dustbins = jsonDecode(response.body);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error loading dustbins')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0), // Blue color for AppBar
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Truck Data',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            DataTable(
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Address')),
                DataColumn(label: Text('Status')),
              ],
              rows: dustbins.map<DataRow>((dustbin) {
                return DataRow(
                  cells: [
                    DataCell(Text(dustbin['dustbin_id'])),
                    DataCell(Text(dustbin['dustbin_Address'])),
                    DataCell(Text(dustbin['dustbinstatus'])),
                  ],
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => _getDustbins(),
                child: const Text('Refresh'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}