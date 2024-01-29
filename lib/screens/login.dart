//import the library and Classes
import 'package:flutter/material.dart';
import 'package:google_mao/core/utils/asset_provider.dart';
import 'package:google_mao/screens/signup.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

import 'vehicle_tracking2.dart';

// import 'Navigation_Bar.dart';
// import 'Sigin.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => StartState();
}

//  This code defines a LoginScreen widget that allows users to enter their email and password,
//and authenticate the login credentials by sending a POST request to a remote server.
class StartState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Future<http.Response> authenticate(String username, String password) async {
  //   var response = await http.post(
  //     Uri.parse('https://tallbrassbook88.conveyor.cloud/DriverLogin'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'username': username,
  //       'password': password,
  //     }),
  //   );
  //   return response;
  // }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: const Color(0xFF2E7D32),
                gradient: LinearGradient(
                  colors: [const Color(0xFF1565C0), new Color(0xFF1565C0)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Image.asset(
                      Assets.images.Logo,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20, top: 20),
                    alignment: Alignment.bottomRight,
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                ],
              )),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: TextFormField(
                controller: _emailController,
                cursorColor: Color(0xFF1565C0),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color(0xFF1565C0),
                  ),
                  hintText: "Enter Username",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xffEEEEEE),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: TextFormField(
                controller: _passwordController,
                cursorColor: const Color(0xFF1565C0),
                decoration: const InputDecoration(
                  focusColor: Color(0xFF1565C0),
                  icon: Icon(
                    Icons.vpn_key,
                    color: Color(0xFF1565C0),
                  ),
                  hintText: "Enter Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // Write Click Listener Code
                },
                child: const Text("Forget Password?"),
              ),
            ),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [(new Color(0xFF1565C0)), new Color(0xffF2861E)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: const Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () async {
                // final username = _emailController.text;
                // final password = _passwordController.text;
                // final response = await authenticate(username, password);
                // if (response.statusCode == 200) {
                //   // authentication successful, navigate to home screen
                //   // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VehicleTracking2()),
                );
                // } else {
                //   // authentication failed, show error message
                //   // ignore: use_build_context_synchronously
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(content: Text('Authentication failed')),
                //   );
                // }
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Don't Have Any Account?  "),
                GestureDetector(
                  child: const Text(
                    "Register Now",
                    style: TextStyle(color: Color(0xFF1565C0)),
                  ),
                  onTap: () {
                    // Write Tap Code Here.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}