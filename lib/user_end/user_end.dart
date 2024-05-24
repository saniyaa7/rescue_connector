import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import '/screens/config.dart';

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

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final Map<String, String> imageNames = {
    'assets/images/fire.jpg': 'Fire Alert',
    'assets/images/floods.jpg': 'Flood Alert',
    'assets/images/EarthQuake.jpg': 'Earthquake Alert',
    'assets/images/Road_Accidents.jpg': 'Road Accident Alert',
    'assets/images/Bomb_blast.jpg': 'Bomb Blast Alert',
  };

  TextEditingController messageController = TextEditingController();
  final String url = '${Config.notificationUrl}/sendMessageNotification';

  Future<void> shareLocation(
      double latitude, double longitude, String messageNotification) async {
    // Constructing Google Static Maps API URL
    String staticMapUrl =
        "https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=15&size=400x400&markers=color:red%7C$latitude,$longitude&key=YOUR_API_KEY";

    // Send SMS notification with map image
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'MessageNotfication': messageNotification,
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
        'mapImageUrl': staticMapUrl,
      }),
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Failed to send notification. Error: ${response.reasonPhrase}');
    }
  }

  Future<void> getCurrentLocationAndShare(String messageNotification) async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      if (position != null) {
        double latitude = position.latitude;
        double longitude = position.longitude;
        await shareLocation(latitude, longitude, messageNotification);
      } else {
        print('Unable to retrieve location');
      }
    } catch (e) {
      print('Error getting location: $e');
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
                      await getCurrentLocationAndShare(imageName);
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
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message here',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () async {
                    String messageNotification = messageController.text;
                    await getCurrentLocationAndShare(messageNotification);
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

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    messageController.dispose();
    super.dispose();
  }
}
