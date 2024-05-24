import 'package:flutter/material.dart';
import 'CrossCommunicationPage.dart';
import 'Profile.dart';
import 'ProneAreaPage.dart';
import 'RequestPage.dart';
import 'about.dart';
import 'screens/signin.dart';
import 'AfterDisaster.dart';
import './map_functionality/map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rescue Connectors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
          ),
        ),
      ),
      home: MyHomePage(),
      routes: {
        '/mapView': (context) => MapView(latitude: 0.0, longitude: 0.0),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  int _selectedCardIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rescue Connectors',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2196F3),
                Color(0xFF3F51B5),
                Color(0xFF5E35B1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignIn()),
            );
          },
        ),
      ),
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildCard(
                "Pre Disaster",
                [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Before any disaster happens, rescue agencies plan and prepare their strategies. They conduct risk assessments, identify vulnerable areas, and coordinate with other agencies.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  _buildButton("Prone Area", _handleTaskForceCreation),
                ],
                0),
            _buildCard(
                "During Disaster",
                [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'During a disaster, rescue agencies execute their plans. They provide immediate assistance, rescue operations, medical aid, and ensure public safety.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  _buildButton("Request for Resources", _handleRequest),
                  _buildButton(
                      "Cross Communication", _handleCrossCommunication),
                ],
                1),
            _buildCard(
                "Success Stories",
                [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'After rescue operations, agencies share success stories to highlight their efforts and the lives saved. These stories inspire others and show the impact of their work.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        _buildButton(
                            "View Success Stories", _handleViewSuccessStories),
                      ],
                    ),
                  ),
                ],
                2),
            SizedBox(height: 20),
          ],
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

  _handleTaskForceCreation() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProneAreaPage()),
    );
  }

  _handleRequest() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RequestPage()),
    );
  }

  _handleCrossCommunication() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CrossCommunicationPage()),
    );
  }

  _handleViewSuccessStories() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AfterDisasterPage()),
    );
  }

  Widget _buildButton(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildCard(String title, List<Widget> content, int index) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: _selectedCardIndex == index ? Colors.grey[200] : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Text color
              ),
            ),
          ),
          Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: content,
          ),
        ],
      ),
    );
  }
}
