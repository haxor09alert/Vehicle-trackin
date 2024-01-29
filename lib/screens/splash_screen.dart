import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mao/core/utils/asset_provider.dart';

import 'Login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return new Timer(duration, loginRoute);
  }

  loginRoute() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: new Color(0xFF1565C0),
              gradient: LinearGradient(
                colors: [(new Color(0xFF1565C0)), (new Color(0xFF1565C0))],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Container(
              child: Image.asset(
                      Assets.images.Logo,
                      height: 100,
                      width: 100,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}