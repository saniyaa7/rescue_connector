import 'package:flutter/material.dart';
import 'Profile.dart';
import 'map_functionality/map.dart';
import 'AllPages.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int _currentIndex = 1;

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
          'About Rescue Connectors',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rescue Connectors',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Rescue Agencies Registration:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'All the rescue agencies will be registered under one platform, where they have to provide details such as name, location, expertise, number of members, and resources (equipment, medical, communication, shelter, and basic necessities).',
              ),
              SizedBox(height: 16),
              Text(
                'Before Disaster:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Rescue agencies can communicate with each other through video conference, messages, and collaborate by creating a Task Force. The Task Force will be a group of nearby rescue agencies in disaster-prone areas.',
              ),
              SizedBox(height: 16),
              Text(
                'During Disaster:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '1. Request for resource to application:',
              ),
              Text(
                'Rescue Agencies can request resources such as manpower, equipment, etc. The application will match to the most suitable rescue agencies based on the availability of resources and distance from the location.',
              ),
              Text(
                '2. Send alerts to Task Force:',
              ),
              Text(
                'Occurrence of disaster in prone areas will result in sending alert notifications to Task Force.',
              ),
              Text(
                '3. Cross Communication:',
              ),
              Text(
                'The application maintains secure channels for communication and allows rescue agencies to track the location of other agencies through GPS.',
              ),
              SizedBox(height: 16),
              Text(
                'Public Usage:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'In case of emergency situations like disasters, the public user will be allowed to report the disaster in the form of images, text, as well as by selection from the given options of disaster. They have to share real-time location (GPS Location) of disaster, resulting in sending alerts to nearby rescue agencies through the application. This platform also allows the public to view instructional videos, enabling them to learn how to protect themselves in various disaster situations.',
              ),
              SizedBox(height: 16),
              Text(
                'Successful Collaboration System:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'This system will showcase stories of successful collaboration between rescue agencies in the form of images, text, as well as videos.',
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MapView(latitude: 0.0, longitude: 0.0)),
            );
          }
        },
      ),
    );
  }
}
