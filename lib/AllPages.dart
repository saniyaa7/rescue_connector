// // AllPages.dart
//
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'Contact.dart';
// import 'CrossCommunicationPage.dart';
// import 'ProneAreaPage.dart';
// import 'RequestPage.dart';
// import 'TaskForceCreation.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Rescue Connectors',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   String txt = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Rescue Connectors'),
//         backgroundColor: Colors.green,
//       ),
//       backgroundColor: Colors.lightBlue[50],
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => RequestPage()),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.red,
//                 onPrimary: Colors.white,
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               ),
//               child: Text(
//                 'Request for resources',
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ProneAreaPage()),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blue,
//                 onPrimary: Colors.white,
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               ),
//               child: Text(
//                 'Prone Area',
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => CrossCommunicationPage()),
//                 );
//               },
//               style: TextButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 foregroundColor: Colors.white,
//                 padding: EdgeInsets.all(16.0),
//                 textStyle: TextStyle(fontSize: 20),
//               ),
//               child: Text('Cross Communication'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _handleContact();
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.orange,
//                 onPrimary: Colors.white,
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               ),
//               child: Text(
//                 'Contact',
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => TaskForceCreation()),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.purple,
//                 onPrimary: Colors.white,
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               ),
//               child: Text(
//                 'Task Force Creation',
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               txt,
//               textScaleFactor: 2,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Function to handle contact button
//   _handleContact() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => ContactPage()),
//     );
//   }
// }







import 'package:flutter/material.dart';
import 'Contact.dart';
import 'CrossCommunicationPage.dart';
import 'Profile.dart';
import 'ProneAreaPage.dart';
import 'RequestPage.dart';
import 'TaskForceCreation.dart';
import 'about.dart'; // Import the AboutPage

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
      ),
      home: MyHomePage(),
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
  String txt = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rescue Connectors'),
        backgroundColor: Color.fromARGB(255, 64, 119, 181),
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RequestPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                'Request for resources',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProneAreaPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                'Prone Area',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CrossCommunicationPage()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.all(16.0),
                textStyle: TextStyle(fontSize: 20),
              ),
              child: Text('Cross Communication'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _handleContact();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                'Contact',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TaskForceCreation()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                'Task Force Creation',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Text(
              txt,
              textScaleFactor: 2,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
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
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Navigate to different pages based on the index
          if (index == 0) {
            // Navigate to the home page (AllPages.dart)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          } else if (index == 1) {
            // Navigate to the about us page (AboutPage.dart)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutPage()),
            );
          } else if (index == 2) {
            // Navigate to the my profile page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );

          }
        },
      ),
    );
  }

  // Function to handle contact button
  _handleContact() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContactPage()),
    );
  }
}
