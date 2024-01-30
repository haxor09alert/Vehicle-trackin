// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// class UserScreen extends StatefulWidget {
//   const UserScreen({super.key});

//   @override
//   State<StatefulWidget> createState() => UserScreen();
// }

// class StartState extends State<UserScreen> {
//   Future<Map<String, dynamic>>? userDataFuture;

//   @override
//   void initState() {
//     super.initState();
//     userDataFuture = _fetchUserData();
//   }

// //  fetching the data of user through get api
//   Future<Map<String, dynamic>> _fetchUserData() async {
//     final response = await http
//         .get(Uri.parse('https://longsageapple59.conveyor.cloud/GetAdminData'));
//     if (response.statusCode == 200) {
//       return json.decode(response.body)[0];
//     } else {
//       throw Exception('Failed to fetch user data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: const Color(0xFF1565C0),
        //   title: Text(
        //     "User Profile",
        //     style: GoogleFonts.bebasNeue(
        //       fontSize: 25,
        //     ),
        //   ),
        // ),
//         body: Center(
//           child: FutureBuilder<Map<String, dynamic>>(
//               future: userDataFuture,
//               builder: (BuildContext context,
//                   AsyncSnapshot<Map<String, dynamic>> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   // Show a loading animation while the data is being fetched
//                   return const CircularProgressIndicator();
//                 } else if (snapshot.hasError) {
//                   // Show an error message if there was an error fetching the data
//                   return Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // CircleAvatar(
//                       //   radius: 50,
//                       //   backgroundImage: AssetImage("assets/images/Logo.png"),
//                       //   // backgroundImage: NetworkImage(
//                       //   //     'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.cnet.com%2Fculture%2Fentertainment%2Fwhat-you-need-to-remember-about-avatar-before-seeing-way-of-water%2F&psig=AOvVaw0HOpJI9DXZeVZwB-9IYN4q&ust=1678297398827000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCKDuwcavyv0CFQAAAAAdAAAAABAE${userData['id']}?d=identicon'),
//                       // ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'Aashutosh Paneru',
//                         style: const TextStyle(fontSize: 24),
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'Aashutosh@gmail.com',
//                         style: const TextStyle(fontSize: 16),
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         "Email Confirmed: ${["emailConfirmed"]}",
//                         style: const TextStyle(fontSize: 20),
//                       ),
//                       const SizedBox(height: 20),
//                       Text(
//                         "Two Factor Enabled: ${["twoFactorEnabled"]}",
//                         style: const TextStyle(fontSize: 20),
//                       ),
//                       const SizedBox(height: 20),
//                       Text(
//                         "Normalized User Name: ${["normalizedUserName"]}",
//                         style: const TextStyle(fontSize: 20),
//                       ),
//                       RatingBar.builder(
//                         initialRating: 4,
//                         minRating: 1,
//                         itemSize: 24,
//                         direction: Axis.horizontal,
//                         allowHalfRating: true,
//                         itemCount: 5,
//                         itemPadding:
//                             const EdgeInsets.symmetric(horizontal: 4.0),
//                         itemBuilder: (context, _) => const Icon(
//                           Icons.star,
//                           color: Colors.amber,
//                         ),
//                         onRatingUpdate: (rating) {
//                           print(rating);
//                         },
//                       ),
//                     ],
//                   );
//                 } else {
//                   // Build the UI using the fetched data
//                   final userData = snapshot.data!;
//                   return Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CircleAvatar(
//                         radius: 50,
//                         // backgroundImage: NetworkImage(
//                         //     'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.cnet.com%2Fculture%2Fentertainment%2Fwhat-you-need-to-remember-about-avatar-before-seeing-way-of-water%2F&psig=AOvVaw0HOpJI9DXZeVZwB-9IYN4q&ust=1678297398827000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCKDuwcavyv0CFQAAAAAdAAAAABAE${userData['id']}?d=identicon'),
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         userData['userName'],
//                         style: const TextStyle(fontSize: 24),
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'email',
//                         style: const TextStyle(fontSize: 16),
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         "Email Confirmed: ${userData["emailConfirmed"]}",
//                         style: const TextStyle(fontSize: 20),
//                       ),
//                       const SizedBox(height: 20),
//                       Text(
//                         "Two Factor Enabled: ${userData["twoFactorEnabled"]}",
//                         style: const TextStyle(fontSize: 20),
//                       ),
//                       const SizedBox(height: 20),
//                       Text(
//                         "Normalized User Name: ${userData["normalizedUserName"]}",
//                         style: const TextStyle(fontSize: 20),
//                       ),
//                       RatingBar.builder(
//                         initialRating: 4,
//                         minRating: 1,
//                         itemSize: 24,
//                         direction: Axis.horizontal,
//                         allowHalfRating: true,
//                         itemCount: 5,
//                         itemPadding:
//                             const EdgeInsets.symmetric(horizontal: 4.0),
//                         itemBuilder: (context, _) => const Icon(
//                           Icons.star,
//                           color: Colors.amber,
//                         ),
//                         onRatingUpdate: (rating) {
//                           print(rating);
//                         },
//                       ),
//                     ],
//                   );
//                 }
//               }),
//         ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF1565C0),
          title: Text(
            "User Profile",
            style: GoogleFonts.bebasNeue(
              fontSize: 25,
            ),
          ),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage('assets/Avatar.png'), // replace with your image asset
            ),
            SizedBox(height: 20.0),
            Text(
              'Name:Ritesh Giri', // replace with user's name
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Email:ritesh.g@gmail.com', // replace with user's email
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Address: Baneshwor', // replace with user's email
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Phone: 9861523985', // replace with user's email
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Trucknumber: 9836', // replace with user's email
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}