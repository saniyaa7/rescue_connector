// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';

// import 'AllPages.dart';
// import 'about.dart';

// class CrossCommunicationPage extends StatefulWidget {
//   @override
//   _CrossCommunicationPageState createState() => _CrossCommunicationPageState();
// }

// class _CrossCommunicationPageState extends State<CrossCommunicationPage> {
//   List<Map<String, String>> agencies = [];
//   List<Map<String, String>> filteredAgencies = [];
//   TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     fetchAgencies();
//     _searchController.addListener(_filterAgencies);
//   }

//   Future<void> fetchAgencies() async {
//     final String url = 'http://localhost:3000/api/auth/data_cross'; // Replace with your API endpoint

//     try {
//       final http.Response response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         List<dynamic> data = json.decode(response.body);
//         setState(() {
//           agencies = data.map((item) {
//             return {
//               'organization_id': item['organization_id'].toString(),
//               'username': item['username'].toString(),
//               'email': item['email'].toString(),
//             };
//           }).toList();
//           filteredAgencies = List.from(agencies);
//         });
//       } else {
//         print('Error fetching agencies: ${response.body}');
//       }
//     } catch (e) {
//       print('Exception occurred: $e');
//     }
//   }

//   void _filterAgencies() {
//     String query = _searchController.text.toLowerCase();
//     setState(() {
//       filteredAgencies = agencies.where((agency) {
//         return agency['username']!.toLowerCase().contains(query);
//       }).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       appBar: AppBar(
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
//         title: Text(
//           'Cross Communication Page',
//           style: TextStyle(color: Colors.white), // Set text color to white
//         ),
//       ),

//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Enter username here...',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               color: Colors.grey[200],
//               child: filteredAgencies.isEmpty
//                   ? Center(child: Text('No data found'))
//                   : ListView.builder(
//                 itemCount: filteredAgencies.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     margin: EdgeInsets.all(8.0),
//                     child: ListTile(
//                       tileColor: Colors.white,
//                       leading: IconButton(
//                         icon: Icon(Icons.phone),
//                         onPressed: () {
//                           _makePhoneCall(filteredAgencies[index]['email']!);
//                         },
//                       ),
//                       trailing: IconButton(
//                         icon: Icon(Icons.message),
//                         onPressed: () {
//                           _sendSMS(filteredAgencies[index]['email']!);
//                         },
//                       ),
//                       title: Text(filteredAgencies[index]['username']!),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Organization ID: ${filteredAgencies[index]['organization_id']}'),
//                           Text('Email: ${filteredAgencies[index]['email']}'),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
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
//         currentIndex: 2,
//         onTap: (index) {
//           if (index == 0) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MyApp()),
//             );
//           } else if (index == 1) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => AboutPage()),
//             );
//           }
//         },
//       ),
//     );
//   }

//   _makePhoneCall(String mobileNumber) async {
//     try {
//       await launch('tel:$mobileNumber');
//     } catch (e) {
//       print('Error launching phone call: $e');
//     }
//   }

//   _sendSMS(String mobileNumber) async {
//     try {
//       await launch('sms:$mobileNumber');
//     } catch (e) {
//       print('Error launching SMS: $e');
//     }
//   }
// }


import 'dart:convert';
import 'package:first/Profile.dart';
import 'package:first/map_functionality/map.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'AllPages.dart';
import 'about.dart';

class CrossCommunicationPage extends StatefulWidget {
  @override
  _CrossCommunicationPageState createState() => _CrossCommunicationPageState();
}

class _CrossCommunicationPageState extends State<CrossCommunicationPage> {
  int _currentIndex = 0;
  List<Map<String, String>> agencies = [];
  List<Map<String, String>> filteredAgencies = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchAgencies();
    _searchController.addListener(_filterAgencies);
  }

  Future<void> fetchAgencies() async {
    final String url = 'http://localhost:3000/api/auth/data_cross'; // Replace with your API endpoint

    try {
      final http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          agencies = data.map((item) {
            return {
              'organization_id': item['organization_id'].toString(),
              'username': item['username'].toString(),
              'email': item['email'].toString(),
              'mobileNumber': item['mobile_number'].toString(), // Fetch mobile number
            };
          }).toList();
          filteredAgencies = List.from(agencies);
        });
      } else {
        print('Error fetching agencies: ${response.body}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
  }

  void _filterAgencies() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredAgencies = agencies.where((agency) {
        return agency['username']!.toLowerCase().contains(query);
      }).toList();
    });
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
          'Cross Communication Page',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter username here...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: filteredAgencies.isEmpty
                  ? Center(child: Text('No data found'))
                  : ListView.builder(
                itemCount: filteredAgencies.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      tileColor: Colors.white,
                      leading: IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () {
                          _makePhoneCall(filteredAgencies[index]['mobileNumber']!); // Fetch phone number
                        },
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.message),
                        onPressed: () {
                          _sendSMS(filteredAgencies[index]['email']!); // Fetch email
                        },
                      ),
                      title: Text(filteredAgencies[index]['username']!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Organization ID: ${filteredAgencies[index]['organization_id']}'),
                          Text('Email: ${filteredAgencies[index]['email']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
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


  _makePhoneCall(String mobileNumber) async {
    try {
      await launch('tel:$mobileNumber');
    } catch (e) {
      print('Error launching phone call: $e');
    }
  }

  _sendSMS(String email) async {
    try {
      await launch('mailto:$email');
    } catch (e) {
      print('Error launching email: $e');
    }
  }
}
