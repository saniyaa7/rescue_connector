// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/basic.dart';
// import 'package:flutter/src/widgets/framework.dart';
//
// // import 'package:flutter/material.dart';
//
// import 'CrossCommunicationPage.dart';
// import 'ProneAreaPage.dart';
// import 'RequestPage.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'FlatButton',
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
//                 primary: Colors.red, // Button color
//                 onPrimary: Colors.white, // Text color
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
//               child: Text('Cross communication'),
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
// }
//
//
//
//
//
//
//
//
//
//  //
//  // import 'package:flutter/material.dart';
//  // import 'package:path/path.dart' as p;
//  // import 'package:url_launcher/url_launcher.dart';
//  //
//  // void main() {
//  //   runApp(const MyApp());
//  // }
//  //
//  // class MyApp extends StatelessWidget {
//  //   const MyApp({super.key});
//  //
//  //   @override
//  //   Widget build(BuildContext context) {
//  //     return const MaterialApp(
//  //       home: DemoPage(),
//  //     );
//  //   }
//  // }
//  //
//  // class DemoPage extends StatelessWidget {
//  //   const DemoPage({super.key});
//  //
//  //   void launchURL() {
//  //     launchUrl(p.toUri('https://flutter.dev'));
//  //   }
//  //
//  //   @override
//  //   Widget build(BuildContext context) {
//  //     return Scaffold(
//  //       body: Center(
//  //         child: ElevatedButton(
//  //           onPressed: launchURL,
//  //           child: const Text('Show Flutter homepage'),
//  //         ),
//  //       ),
//  //     );
//  //   }
//  // }








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
//                 // Add code to handle contact
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
//                 // Add code to handle task force creation
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

import 'package:first/screens/signin.dart';
// import 'package:your_flutter_app/screens/signin_page.dart'; // Import the file for your sign-in page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Flutter App',
      home: SignIn(), // Directly set the sign-in page as the home
    );
  }
}
