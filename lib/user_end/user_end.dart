// import 'package:flutter/material.dart';

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
//               itemCount: images.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     showPopUp(context);
//                   },
//                   child: Image.asset(
//                     images[index],
//                     fit: BoxFit.cover, // or BoxFit.contain
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

  Future<Position> getCurrentLocation() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
       throw Exception('Location services are disabled');
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return position;
    } catch (e) {
      // Handle error when unable to retrieve location
       print('Error getting current location: $e');
     rethrow;
    }
  }

  Future<void> sendNotification(String imageName, double latitude, double longitude) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/sendNotification'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'imageName': imageName,
        'latitude': latitude,
        'longitude': longitude,
      }),
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Failed to send notification. Error: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calamities'),
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
                return GestureDetector(
                  onTap: () async {
                    final imageName = imageNames.values.toList()[index];
                    Position position = await getCurrentLocation();
                    if (position != null) {
                      double latitude = position.latitude;
                      double longitude = position.longitude;
                      sendNotification(imageName, latitude, longitude);
                      showPopUp(context);
                    } else {
                      // Handle case when unable to retrieve location
                      print('Unable to retrieve location');
                    }
                  },
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}