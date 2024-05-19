// import 'package:flutter/material.dart';
// import 'CrossCommunicationPage.dart';
// import 'Profile.dart';
// import 'ProneAreaPage.dart';
// import 'RequestPage.dart';
// import 'about.dart'; // Import the AboutPage
// import 'screens/signin.dart'; // Import the SignInPage
// import 'AfterDisaster.dart'; // Import the AfterDisasterPage

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Rescue Connectors',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         appBarTheme: AppBarTheme(
//           backgroundColor: Colors.transparent, // Make app bar transparent
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue, // Button background color
//           ),
//         ),
//         textButtonTheme: TextButtonThemeData(
//           style: TextButton.styleFrom(
//             foregroundColor: Colors.blue, // Text button color
//           ),
//         ),
//       ),
//       home: MyHomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _currentIndex = 0;
//   String txt = '';
//   int _selectedCardIndex = -1; // Initially no card is selected

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Rescue Connectors',
//           style: TextStyle(color: Colors.white), // App bar text color
//         ),
//         backgroundColor: Colors.transparent, // App bar background color
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
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SignIn()), // Navigate to SignInPage
//             );
//           },
//         ),
//       ),
//       backgroundColor: Colors.blue[50], // Background color of the body
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _buildCard("Pre Disaster", [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'Before any disaster happens, rescue agencies plan and prepare their strategies. They conduct risk assessments, identify vulnerable areas, and coordinate with other agencies.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//               _buildButton("Prone Area", _handleTaskForceCreation),
//             ], 0),
//             _buildCard("During Disaster", [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'During a disaster, rescue agencies execute their plans. They provide immediate assistance, rescue operations, medical aid, and ensure public safety.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//               _buildButton("Request for Resources", _handleRequest),
//               _buildButton("Cross Communication", _handleCrossCommunication),
//             ], 1),
//             _buildCard("Success Stories", [
//               Container(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Text(
//                       'After rescue operations, agencies share success stories to highlight their efforts and the lives saved. These stories inspire others and show the impact of their work.',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     SizedBox(height: 20),
//                     _buildButton("View Success Stories", _handleViewSuccessStories),
//                   ],
//                 ),
//               ),
//             ], 2),
//             SizedBox(height: 20),
//             Text(
//               txt,
//               textScaleFactor: 2,
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.info),
//             label: 'About Us',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'My Profile',
//           ),
//         ],
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });

//           // Navigate to different pages based on the index
//           if (index == 0) {
//             // Navigate to the home page (MyHomePage)
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MyHomePage()),
//             );
//           } else if (index == 1) {
//             // Navigate to the about us page (AboutPage)
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => AboutPage()),
//             );
//           } else if (index == 2) {
//             // Navigate to the my profile page (ProfilePage)
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ProfilePage()),
//             );
//           }
//         },
//       ),
//     );
//   }

//   // Function to handle task force creation button
//   _handleTaskForceCreation() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => ProneAreaPage()),
//     );
//   }

//   // Function to handle request for resources button
//   _handleRequest() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => RequestPage()),
//     );
//   }

//   // Function to handle cross communication button
//   _handleCrossCommunication() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => CrossCommunicationPage()),
//     );
//   }

//   // Function to handle view success stories button
//   _handleViewSuccessStories() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => AfterDisasterPage()),
//     );
//   }

//   // Function to build buttons
//   Widget _buildButton(String label, VoidCallback onPressed) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ElevatedButton(
//         onPressed: onPressed,
//         child: Text(
//           label,
//           style: TextStyle(fontSize: 18),
//         ),
//       ),
//     );
//   }

//   // Function to build cards
//   Widget _buildCard(String title, List<Widget> content, int index) {
//     return Container(
//       margin: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: _selectedCardIndex == index ? Colors.grey[200] : Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               title,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black, // Text color
//               ),
//             ),
//           ),
//           Divider(),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: content,
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'CrossCommunicationPage.dart';
import 'Profile.dart';
import 'ProneAreaPage.dart';
import 'RequestPage.dart';
import 'about.dart'; // Import the AboutPage
import 'screens/signin.dart'; // Import the SignInPage
import 'AfterDisaster.dart'; // Import the AfterDisasterPage
import './map_functionality/map.dart'; // Ensure this file exists and contains the MapView widget

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
          backgroundColor: Colors.transparent, // Make app bar transparent
          iconTheme: IconThemeData(color: Colors.black), // Icon color to black
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Button background color
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue, // Text button color
          ),
        ),
      ),
      home: MyHomePage(),
      routes: {
        '/mapView': (context) => MapView(latitude: 0.0, longitude: 0.0), // Define your MapView widget
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
  int _selectedCardIndex = -1; // Define _selectedCardIndex

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rescue Connectors',
          style: TextStyle(color: Colors.white), // App bar text color
        ),
        backgroundColor: Colors.transparent, // App bar background color
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignIn()), // Navigate to SignInPage
            );
          },
        ),
      ),
      backgroundColor: Colors.blue[50], // Background color of the body
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildCard("Pre Disaster", [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Before any disaster happens, rescue agencies plan and prepare their strategies. They conduct risk assessments, identify vulnerable areas, and coordinate with other agencies.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              _buildButton("Prone Area", _handleTaskForceCreation),
            ], 0),
            _buildCard("During Disaster", [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'During a disaster, rescue agencies execute their plans. They provide immediate assistance, rescue operations, medical aid, and ensure public safety.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              _buildButton("Request for Resources", _handleRequest),
              _buildButton("Cross Communication", _handleCrossCommunication),
            ], 1),
            _buildCard("Success Stories", [
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
                    _buildButton("View Success Stories", _handleViewSuccessStories),
                  ],
                ),
              ),
            ], 2),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black, // Selected icon color
        unselectedItemColor: Colors.black, // Unselected icon color
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

          // Navigate to different pages based on the index
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
              MaterialPageRoute(builder: (context) => MapView(latitude: 0.0, longitude: 0.0)),
            );
          }
        },
      ),
    );
  }

  // Function to handle task force creation button
  _handleTaskForceCreation() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProneAreaPage()),
    );
  }

  // Function to handle request for resources button
  _handleRequest() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RequestPage()),
    );
  }

  // Function to handle cross communication button
  _handleCrossCommunication() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CrossCommunicationPage()),
    );
  }

  // Function to handle view success stories button
  _handleViewSuccessStories() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AfterDisasterPage()),
    );
  }

  // Function to build buttons
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

  // Function to build cards
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
