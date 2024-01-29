import 'package:flutter/material.dart';
import 'package:google_mao/core/utils/asset_provider.dart';
import 'package:google_mao/screens/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:trashset/Login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => InitState();
}

// This method authenticates the user by sending a POST request to a backend server with the user's entered details such as
class InitState extends State<SignUpScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phonenumberController = TextEditingController();

  Future<http.Response> authenticate(String username, String email,
      String password, String phoneNumber) async {
    var response = await http.post(
      Uri.parse('https://tallbrassbook88.conveyor.cloud/driverRegister'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // username, email, password, and phone number. It returns a Future object that will contain the server's response
      body: jsonEncode(<String, String>{
        "username": username,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
      }),
    );
    return response;
  }

  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: new Color(0xFF1565C0),
                gradient: LinearGradient(
                  colors: [(new Color(0xFF1565C0)), new Color(0xffF2861E)],
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
                      height: 110,
                      width: 110,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20, top: 20),
                    alignment: Alignment.bottomRight,
                    child: const Text(
                      "Register",
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
                controller: _usernameController,
                cursorColor: Color(0xFF1565C0),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Color(0xFF1565C0),
                  ),
                  hintText: "Username",
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
                  hintText: "Email",
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
                cursorColor: Color(0xFF1565C0),
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
                controller: _phonenumberController,
                cursorColor: Color(0xFF1565C0),
                decoration: const InputDecoration(
                  focusColor: Color(0xFF1565C0),
                  icon: Icon(
                    Icons.phone,
                    color: Color(0xFF1565C0),
                  ),
                  hintText: "Phone Number",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                // Write Click Listener Code Here.
                // final username = _usernameController.text;
                // final email = _emailController.text;
                // final password = _passwordController.text;
                // final phoneNumber = _phonenumberController.text;
                // final response =
                //     await authenticate(username, email, password, phoneNumber);
                // if (response.statusCode == 200) {
                  //authentication successful, navigate to home screen
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Register sucessfull')),
                  );
                // } 
                // else {
                //   // authentication failed, show error message
                //   // ignore: use_build_context_synchronously
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(content: Text('Register sucessfull ')),
                //   );
                // }
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [new Color(0xFF1565C0), new Color(0xffF2861E)],
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
                  "REGISTER",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Have Already Member? "),
                  GestureDetector(
                    child: const Text(
                      "Login Now",
                      style: TextStyle(color: Color(0xFF1565C0)),
                    ),
                    onTap: () {
                      // Write Tap Code Here.
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}