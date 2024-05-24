import 'package:flutter/material.dart';
import 'AllPages.dart';
import 'Profile.dart';
import 'map_functionality/map.dart';
import 'about.dart';

class AfterDisasterPage extends StatefulWidget {
  @override
  _AfterDisasterPageState createState() => _AfterDisasterPageState();
}

class _AfterDisasterPageState extends State<AfterDisasterPage> {
  int _currentIndex = 0;
  List<bool> _expanded = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'After Disaster',
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
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
        ),
      ),
      body: ListView(
        children: [
          _buildExpansionTile(
            title: "GUWAHATI: Rescue operations in the Assam floods",
            content:
                'GUWAHATI: Rescue operations in the Assam floods this season have been a big challenge for disaster management agencies, including the Army. While there were complaints of no ration in many relief camps, the rescuers left no stone unturned to reach them with food and relief. The most vulnerable, like pregnant women and the elderly, were taken to safe places with utmost care.',
            imagePath: 'assets/images/succes_story_guwahati.jpeg',
            index: 0,
          ),
          _buildExpansionTile(
            title: "DEHRADUN/ SILKYARA: The multi-agency operation",
            content:
                'DEHRADUN/ SILKYARA: The multi-agency operation to rescue 41 workers trapped inside the Silkyara tunnel in Uttarkashi finally succeeded after days of ups and downs, waves of hope and despair on Tuesday evening when all of them were safely brought out. The massive effort, unprecedented in its magnitude and ambition, ended an ordeal that lasted 17 days and had the entire government machinery, including the PMO, putting its might behind the evacuation exercise.',
            imagePath: 'assets/images/succes_story_dehradun.jpeg',
            index: 1,
          ),
        ],
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

  Widget _buildExpansionTile(
      {required String title,
      required String content,
      required String imagePath,
      required int index}) {
    return ExpansionTile(
      title: Text(title),
      trailing: Icon(_expanded[index] ? Icons.expand_less : Icons.expand_more),
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(content),
        ),
      ],
      onExpansionChanged: (bool expanded) {
        setState(() {
          _expanded[index] = expanded;
        });
      },
    );
  }
}
