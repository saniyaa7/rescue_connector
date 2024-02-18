import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Rescue Connectors'),
        backgroundColor: Color.fromARGB(255, 64, 119, 181),
      ),
      body: Padding(
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
          ],
        ),
      ),
    );
  }
}
