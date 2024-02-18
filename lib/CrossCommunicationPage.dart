// // // CrossCommunicationPage.dart
// // import 'package:flutter/material.dart';
// // import 'launch_utils.dart'; // Import the utility class
// //
// // class CrossCommunicationPage extends StatelessWidget {
// //   final List<Map<String, String>> agencies = [
// //     {
// //       'name': 'Agency 1',
// //       'address': 'Address 1',
// //       'headPersonName': 'Head Person 1',
// //       'phoneNumber': '+8237939131',
// //     },
// //     {
// //       'name': 'Agency 2',
// //       'address': 'Address 2',
// //       'headPersonName': 'Head Person 2',
// //       'phoneNumber': '+1234567892',
// //     },
// //     {
// //       'name': 'Agency 3',
// //       'address': 'Address 3',
// //       'headPersonName': 'Head Person 3',
// //       'phoneNumber': '+1234567893',
// //     },
// //     {
// //       'name': 'Agency 4',
// //       'address': 'Address 4',
// //       'headPersonName': 'Head Person 4',
// //       'phoneNumber': '+1234567894',
// //     },
// //     {
// //       'name': 'Agency 5',
// //       'address': 'Address 5',
// //       'headPersonName': 'Head Person 5',
// //       'phoneNumber': '+1234567895',
// //     },
// //     {
// //       'name': 'Agency 6',
// //       'address': 'Address 6',
// //       'headPersonName': 'Head Person 6',
// //       'phoneNumber': '+1234567896',
// //     },
// //     {
// //       'name': 'Agency 7',
// //       'address': 'Address 7',
// //       'headPersonName': 'Head Person 7',
// //       'phoneNumber': '+1234567897',
// //     },
// //     {
// //       'name': 'Agency 8',
// //       'address': 'Address 8',
// //       'headPersonName': 'Head Person 8',
// //       'phoneNumber': '+1234567898',
// //     },
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Cross Communication Page'),
// //         backgroundColor: Colors.blue, // Set the background color of the AppBar
// //       ),
// //       body: Container(
// //         color: Colors.grey[200], // Set the background color of the body
// //         child: ListView.builder(
// //           itemCount: agencies.length,
// //           itemBuilder: (context, index) {
// //             return Card(
// //               margin: EdgeInsets.all(8.0),
// //               child: ListTile(
// //                 tileColor: Colors.white, // Set the background color of the ListTile
// //                 leading: IconButton(
// //                   icon: Icon(Icons.phone),
// //                   onPressed: () {
// //                     LaunchUtils.makePhoneCall(agencies[index]['phoneNumber']!);
// //                   },
// //                 ),
// //                 title: Text(agencies[index]['name']!),
// //                 subtitle: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text('Head Person: ${agencies[index]['headPersonName']}'),
// //                     Text('Address: ${agencies[index]['address']}'),
// //                   ],
// //                 ),
// //               ),
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
//
//
// // CrossCommunicationPage.dart
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class CrossCommunicationPage extends StatelessWidget {
//   List<Map<String, String>> agencies = [
//     {
//       'name': 'Agency 1',
//       'address': 'Address 1',
//       'headPersonName': 'Head Person 1',
//       'phoneNumber': '8237939131',
//     },
//     {
//       'name': 'Agency 2',
//       'address': 'Address 2',
//       'headPersonName': 'Head Person 2',
//       'phoneNumber': '+9096198872',
//     },
//     {
//       'name': 'Agency 3',
//       'address': 'Address 7',
//       'headPersonName': 'Head Person 7',
//       'phoneNumber': '8856814335',
//     },
//     {
//       'name': 'Agency 4',
//       'address': 'Address 8',
//       'headPersonName': 'Head Person 8',
//       'phoneNumber': '8767502920',
//     },
//     {
//       'name': 'Agency 5',
//       'address': 'Address 1',
//       'headPersonName': 'Head Person 1',
//       'phoneNumber': '8237939131',
//     },
//     {
//       'name': 'Agency 6',
//       'address': 'Address 2',
//       'headPersonName': 'Head Person 2',
//       'phoneNumber': '+9096198872',
//     },
//     {
//       'name': 'Agency 7',
//       'address': 'Address 7',
//       'headPersonName': 'Head Person 7',
//       'phoneNumber': '8856814335',
//     },
//     {
//       'name': 'Agency 8',
//       'address': 'Address 8',
//       'headPersonName': 'Head Person 8',
//       'phoneNumber': '8767502920',
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cross Communication Page'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Container(
//         color: Colors.grey[200],
//         child: ListView.builder(
//           itemCount: agencies.length,
//           itemBuilder: (context, index) {
//             return Card(
//               margin: EdgeInsets.all(8.0),
//               child: ListTile(
//                 tileColor: Colors.white,
//                 leading: IconButton(
//                   icon: Icon(Icons.phone),
//                   onPressed: () {
//                     _makePhoneCall(agencies[index]['phoneNumber']!);
//                   },
//                 ),
//                 trailing: IconButton(
//                   icon: Icon(Icons.message),
//                   onPressed: () {
//                     _sendSMS(agencies[index]['phoneNumber']!);
//                   },
//                 ),
//                 title: Text(agencies[index]['name']!),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Head Person: ${agencies[index]['headPersonName']}'),
//                     Text('Address: ${agencies[index]['address']}'),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   _makePhoneCall(String phoneNumber) async {
//     try {
//       await launch('tel:$phoneNumber');
//     } catch (e) {
//       print('Error launching phone call: $e');
//     }
//   }
//
//   _sendSMS(String phoneNumber) async {
//     try {
//       await launch('sms:$phoneNumber');
//     } catch (e) {
//       print('Error launching SMS: $e');
//     }
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
// //
// // // CrossCommunicationPage.dart
// // import 'package:flutter/material.dart';
// // import 'launch_utils.dart'; // Import the utility class
// // import 'package:cloud_firestore/cloud_firestore.dart';
// //
// // class CrossCommunicationPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Cross Communication Page'),
// //         backgroundColor: Colors.blue,
// //       ),
// //       body: Container(
// //         color: Colors.grey[200],
// //         child: FutureBuilder<List<Map<String, String>>>(
// //           future: fetchAgenciesFromFirebase(), // Define a function to fetch data
// //           builder: (context, snapshot) {
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return CircularProgressIndicator();
// //             } else if (snapshot.hasError) {
// //               return Text('Error: ${snapshot.error}');
// //             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //               return Text('No agencies found.');
// //             } else {
// //               return ListView.builder(
// //                 itemCount: snapshot.data!.length,
// //                 itemBuilder: (context, index) {
// //                   return Card(
// //                     margin: EdgeInsets.all(8.0),
// //                     child: ListTile(
// //                       tileColor: Colors.white,
// //                       leading: IconButton(
// //                         icon: Icon(Icons.phone),
// //                         onPressed: () {
// //                           LaunchUtils.makePhoneCall(snapshot.data![index]['phoneNumber']);
// //                         },
// //                       ),
// //                       title: Text(snapshot.data![index]['name']),
// //                       subtitle: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text('Head Person: ${snapshot.data![index]['headPersonName']}'),
// //                           Text('Address: ${snapshot.data![index]['address']}'),
// //                         ],
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               );
// //             }
// //           },
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Function to fetch agencies from Firebase
// //   Future<List<Map<String, String>>> fetchAgenciesFromFirebase() async {
// //     final QuerySnapshot<Map<String, dynamic>> snapshot =
// //     await FirebaseFirestore.instance.collection('agencies').get();
// //
// //     return snapshot.docs.map((doc) => Map<String, String>.from(doc.data())).toList();
// //   }
// // }






import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'AllPages.dart';
import 'about.dart';

class CrossCommunicationPage extends StatelessWidget {
  List<Map<String, String>> agencies = [
    {
      'name': 'Agency 1',
      'address': 'Address 1',
      'headPersonName': 'Head Person 1',
      'phoneNumber': '8237939131',
    },
    {
      'name': 'Agency 2',
      'address': 'Address 2',
      'headPersonName': 'Head Person 2',
      'phoneNumber': '+9096198872',
    },
    {
      'name': 'Agency 3',
      'address': 'Address 7',
      'headPersonName': 'Head Person 7',
      'phoneNumber': '8856814335',
    },
    {
      'name': 'Agency 4',
      'address': 'Address 8',
      'headPersonName': 'Head Person 8',
      'phoneNumber': '8767502920',
    },
    {
      'name': 'Agency 5',
      'address': 'Address 1',
      'headPersonName': 'Head Person 1',
      'phoneNumber': '8237939131',
    },
    {
      'name': 'Agency 6',
      'address': 'Address 2',
      'headPersonName': 'Head Person 2',
      'phoneNumber': '+9096198872',
    },
    {
      'name': 'Agency 7',
      'address': 'Address 7',
      'headPersonName': 'Head Person 7',
      'phoneNumber': '8856814335',
    },
    {
      'name': 'Agency 8',
      'address': 'Address 8',
      'headPersonName': 'Head Person 8',
      'phoneNumber': '8767502920',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cross Communication Page'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView.builder(
          itemCount: agencies.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.white,
                leading: IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () {
                    _makePhoneCall(agencies[index]['phoneNumber']!);
                  },
                ),
                trailing: IconButton(
                  icon: Icon(Icons.message),
                  onPressed: () {
                    _sendSMS(agencies[index]['phoneNumber']!);
                  },
                ),
                title: Text(agencies[index]['name']!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Head Person: ${agencies[index]['headPersonName']}'),
                    Text('Address: ${agencies[index]['address']}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: 2, // Index 2 corresponds to the current page (CrossCommunicationPage)
        onTap: (index) {
          // Handle navigation here
          if (index == 0) {
            // Navigate to the home page (MyApp.dart)
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
            // Stay on the current page (CrossCommunicationPage)
          }
        },
      ),
    );
  }

  _makePhoneCall(String phoneNumber) async {
    try {
      await launch('tel:$phoneNumber');
    } catch (e) {
      print('Error launching phone call: $e');
    }
  }

  _sendSMS(String phoneNumber) async {
    try {
      await launch('sms:$phoneNumber');
    } catch (e) {
      print('Error launching SMS: $e');
    }
  }
}
