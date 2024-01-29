// ignore: file_names
// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'Truck.dart';
import 'trucklocation.dart';
import 'User.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController _pageController = PageController();

  List<Widget> _screens = [
    const DustbinSeggregation(),
    const ViewDustbinsScreen(),
    const UserScreen()
  ];

  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),

      bottomNavigationBar: CurvedNavigationBar(
        onTap: _onItemTapped,
        items: const <Widget>[
          Icon(Icons.travel_explore_sharp, size: 30),
          // Icon(Icons.dashboard, size: 30),
          Icon(Icons.fire_truck_outlined, size: 30),
          // Icon(Icons.chat_bubble_rounded, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: const Color(0xFF1565C0),
        buttonBackgroundColor: Colors.white,
        backgroundColor: const Color(0xFF1565C0),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        // onTap: _onPageChanged,
        // // Write Tap Code Here
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => HomePageScreen(),
        //   ),
        // );
        // Write Click Listener Code Here.
        // letIndexChange: (value) => true,
      ),
      // body: Container(
      //   color: Colors.blueAccent,
      //   child: Center(
      //     child: Column(),
      //   ),
      // ),
    );
  }
}