import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Color.fromARGB(255, 64, 119, 181),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://example.com/profile_image.jpg'), // Replace with your profile image URL
            ),
            SizedBox(height: 16),
            Text(
              'ABC ', // Replace with your name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Software Developer', // Replace with your occupation
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'About Me:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'I am a passionate software developer with a keen interest in mobile app development.',
            ),
            SizedBox(height: 16),
            Text(
              'Contact Information:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Email: abc@example.com\nPhone: +1 (123) 456-7890', // Replace with your contact information
            ),
          ],
        ),
      ),
    );
  }
}
