// import 'package:flutter/material.dart';

// import '../screens/signin.dart';

// void main() {
//   runApp(MyApp1());
// }

// class MyApp1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Grid with Camera',
//       debugShowCheckedModeBanner: false, // Ensure debug banner is removed
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SecondPage(),
//     );
//   }
// }

// class SecondPage extends StatelessWidget {
//   final List<String> images = [
//     'assets/images/fire.jpg',
//     'assets/images/floods.jpg',
//     'assets/images/EarthQuake.jpg',
//     'assets/images/Road_Accidents.jpg',
//     'assets/images/Bomb_blast.jpg',
//   ];

//   void showPopUp(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Success'),
//           content: Text('Your request has been sent.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xFF2196F3), // Blue
//                 Color(0xFF3F51B5), // Indigo
//                 Color(0xFF5E35B1), // Deep Purple
//               ],
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//             ),
//           ),
//         ),
//         title: Text(
//           'Calamities',
//           style: TextStyle(color: Colors.white), // Set text color to white
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SignIn()),
//             );
//           },
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 8.0,
//                 mainAxisSpacing: 8.0,
//               ),
//               itemCount: images.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       showPopUp(context);
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(8.0),
//                         child: Image.asset(
//                           images[index],
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     // Open camera logic goes here
//                     print('Opening Camera');
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(8.0),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8.0),
//                       border: Border.all(color: Colors.grey),
//                     ),
//                     child: Icon(Icons.camera_alt),
//                   ),
//                 ),
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Type your message here',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     showPopUp(context);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:geolocator/geolocator.dart';

// void main() {
//   runApp(MyApp1());
// }

// class MyApp1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Grid with Camera',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SecondPage(),
//     );
//   }
// }

// class SecondPage extends StatelessWidget {
//   final Map<String, String> imageNames = {
//     'assets/images/fire.jpg': 'Fire Alert',
//     'assets/images/floods.jpg': 'Flood Alert',
//     'assets/images/EarthQuake.jpg': 'Earthquake Alert',
//     'assets/images/Road_Accidents.jpg': 'Road Accident Alert',
//     'assets/images/Bomb_blast.jpg': 'Bomb Blast Alert',
//   };

//   Future<void> shareLocation(double latitude, double longitude) async {
//     // Constructing Google Static Maps API URL
//     String staticMapUrl =
//         "https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=15&size=400x400&markers=color:red%7C$latitude,$longitude&key=AIzaSyCj9cp2GBiIvuwKZJuFjp5JI3CPaTlAPlM";

//     // Send SMS notification with map image
//     final response = await http.post(
//       Uri.parse('http://localhost:3000/sendNotification'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({
//         'mapImageUrl': staticMapUrl,
//       }),
//     );

//     if (response.statusCode == 200) {
//       print('Notification sent successfully');
//     } else {
//       print('Failed to send notification. Error: ${response.reasonPhrase}');
//     }
//   }

//   Future<void> getCurrentLocationAndShare() async {
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//     if (position != null) {
//       double latitude = position.latitude;
//       double longitude = position.longitude;
//       await shareLocation(latitude, longitude);
//     } else {
//       print('Unable to retrieve location');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Calamities'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 8.0,
//                 mainAxisSpacing: 8.0,
//               ),
//               itemCount: imageNames.length,
//               itemBuilder: (context, index) {
//                 final imagePath = imageNames.keys.toList()[index];
//                 final imageName = imageNames.values.toList()[index];
//                 return GestureDetector(
//                   onTap: () async {
//                     await getCurrentLocationAndShare();
//                   },
//                   child: Image.asset(
//                     imagePath,
//                     fit: BoxFit.cover,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Grid with Camera',
      debugShowCheckedModeBanner: false, // Ensure debug banner is removed
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SecondPage(),
    );
  }
}

class SecondPage extends StatelessWidget {
  final Map<String, String> imageNames = {
    'assets/images/fire.jpg': 'Fire Alert',
    'assets/images/floods.jpg': 'Flood Alert',
    'assets/images/EarthQuake.jpg': 'Earthquake Alert',
    'assets/images/Road_Accidents.jpg': 'Road Accident Alert',
    'assets/images/Bomb_blast.jpg': 'Bomb Blast Alert',
  };

  Future<void> shareLocation(double latitude, double longitude) async {
    // Constructing Google Static Maps API URL
    String staticMapUrl =
        "https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=15&size=400x400&markers=color:red%7C$latitude,$longitude&key=AIzaSyCj9cp2GBiIvuwKZJuFjp5JI3CPaTlAPlM";

    // Send SMS notification with map image
    final response = await http.post(
      Uri.parse('http://localhost:3036/sendNotification'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'mapImageUrl': staticMapUrl,
      }),
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Failed to send notification. Error: ${response.reasonPhrase}');
    }
  }

  Future<void> getCurrentLocationAndShare() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    if (position != null) {
      double latitude = position.latitude;
      double longitude = position.longitude;
      await shareLocation(latitude, longitude);
    } else {
      print('Unable to retrieve location');
    }
  }

  void showPopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Your request has been sent.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2196F3), // Blue
                Color(0xFF3F51B5), // Indigo
                Color(0xFF5E35B1), // Deep Purple
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: Text(
          'Calamities',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: imageNames.length,
              itemBuilder: (context, index) {
                final imagePath = imageNames.keys.toList()[index];
                final imageName = imageNames.values.toList()[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      await getCurrentLocationAndShare();
                      showPopUp(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // Open camera logic goes here
                    print('Opening Camera');
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Icon(Icons.camera_alt),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type your message here',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    showPopUp(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
