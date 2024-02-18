//
//
//
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import 'AllPages.dart';
// import 'about.dart';
//
// class ContactPage extends StatefulWidget {
//   const ContactPage({Key? key}) : super(key: key);
//
//   @override
//   _ContactPageState createState() => _ContactPageState();
// }
//
// class _ContactPageState extends State<ContactPage> {
//   late TextEditingController _phoneNumberController;
//
//   @override
//   void initState() {
//     super.initState();
//     _phoneNumberController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     _phoneNumberController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.secondary,
//         title: const Text('Contact Page'), // Set a default title or leave it empty
//       ),
//       body: Builder(
//         builder: (BuildContext context) {
//           return Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextField(
//                     controller: _phoneNumberController,
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                       labelText: 'Enter phone number',
//                       border: OutlineInputBorder(),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () async {
//                       final phoneNumber = _phoneNumberController.text.trim();
//                       if (phoneNumber.isEmpty || phoneNumber.length < 10) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                               content:
//                               Text('Please enter a valid phone number')),
//                         );
//                       } else {
//                         if (!await launch('tel:$phoneNumber')) {
//                           throw 'Could not launch';
//                         }
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.blue, // Set button background color here
//                     ),
//                     child: const Text(
//                       'CALL',
//                       style: TextStyle(
//                           color: Colors.white), // Set text color here
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () async {
//                       final phoneNumber = _phoneNumberController.text.trim();
//                       if (phoneNumber.isEmpty || phoneNumber.length < 10) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                               content:
//                               Text('Please enter a valid phone number')),
//                         );
//                       } else {
//                         if (!await launch('sms:$phoneNumber')) {
//                           throw 'Could not launch';
//                         }
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.blue, // Set button background color here
//                     ),
//                     child: const Text(
//                       'SMS',
//                       style: TextStyle(
//                           color: Colors.white), // Set text color here
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
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
//         currentIndex: 2, // Index 2 corresponds to the current page (ContactPage)
//         onTap: (index) {
//           // Handle navigation here
//           if (index == 0) {
//             // Navigate to the home page (MyApp.dart)
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MyApp()),
//             );
//           } else if (index == 1) {
//             // Navigate to the about us page (AboutPage.dart)
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => AboutPage()),
//             );
//           } else if (index == 2) {
//             // Stay on the current page (ContactPage)
//           }
//         },
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'AllPages.dart';
import 'about.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 64, 119, 181),
        title: const Text('Contact Page'), // Set a default title or leave it empty
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Enter phone number',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      final phoneNumber = _phoneNumberController.text.trim();
                      if (phoneNumber.isEmpty || phoneNumber.length < 10) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                              Text('Please enter a valid phone number')),
                        );
                      } else {
                        if (!await launch('tel:$phoneNumber')) {
                          throw 'Could not launch';
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Set button background color here
                    ),
                    child: const Text(
                      'CALL',
                      style: TextStyle(
                          color: Colors.white), // Set text color here
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      final phoneNumber = _phoneNumberController.text.trim();
                      if (phoneNumber.isEmpty || phoneNumber.length < 10) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                              Text('Please enter a valid phone number')),
                        );
                      } else {
                        if (!await launch('sms:$phoneNumber')) {
                          throw 'Could not launch';
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Set button background color here
                    ),
                    child: const Text(
                      'SMS',
                      style: TextStyle(
                          color: Colors.white), // Set text color here
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
        currentIndex: 2, // Index 2 corresponds to the current page (ContactPage)
        onTap: (index) {
          // Handle navigation here
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
            // Stay on the current page (ContactPage)
          }
        },
      ),
    );
  }
}
