//RequestPage.dart
/*
import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final TextEditingController _textEditingController = TextEditingController();

  List<Agency> agencies = [
    Agency('Agency 1', ['Medicines', 'First Aid Kit', 'Ambulances', 'Clothes', 'Irons']),
    Agency('Agency 2', ['First Aid Kit', 'Ambulances', 'Clothes']),
    Agency('Agency 3', ['Medicines', 'Ambulances', 'Irons']),
    Agency('Agency 4', ['Ambulances']),
    Agency('Agency 5', ['Medicines', 'Clothes', 'Irons']),
    Agency('Agency 6', ['Medicines', 'Clothes', 'Irons']),
    Agency('Agency 7', ['First Aid Kit', 'Ambulances']),
    Agency('Agency 8', ['Medicines', 'Ambulances']),
  ];

  List<Agency> filteredAgencies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Page'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'All Agency details available here...',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _textEditingController,
              onChanged: (value) {
                filterAgencies(value);
              },
              decoration: InputDecoration(
                hintText: 'Enter your search query',
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle search action here
                      // You can access the entered text using the TextField controller
                      // For simplicity, let's print the entered text to the console
                      print('Search Button Pressed. Query: ${_textEditingController.text}');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                    ),
                    child: Icon(Icons.search),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _textEditingController.text.isEmpty
                    ? agencies.length
                    : filteredAgencies.length,
                itemBuilder: (context, index) {
                  return AgencyBox(
                    agency: _textEditingController.text.isEmpty
                        ? agencies[index]
                        : filteredAgencies[index],
                    showEquipmentDetails: _showEquipmentDetailsDialog,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void filterAgencies(String query) {
    setState(() {
      filteredAgencies = agencies
          .where((agency) =>
      agency.name.toLowerCase().contains(query.toLowerCase()) ||
          agency.equipments.any((equipment) => equipment.toLowerCase().contains(query.toLowerCase())))
          .toList();
    });
  }

  void _showEquipmentDetailsDialog(Agency agency) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Equipment Details - ${agency.name}'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Equipments available:'),
              SizedBox(height: 8),
              for (String equipment in agency.equipments)
                Text('- $equipment: ${_getEquipmentCount(agency, equipment)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  int _getEquipmentCount(Agency agency, String equipment) {
    return agency.equipments.where((e) => e == equipment).length;
  }
}

class Agency {
  final String name;
  final List<String> equipments;

  Agency(this.name, this.equipments);
}

class AgencyBox extends StatelessWidget {
  final Agency agency;
  final Function(Agency) showEquipmentDetails;

  AgencyBox({required this.agency, required this.showEquipmentDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              showEquipmentDetails(agency);
            },
            child: Text(
              'Rescue Agency: ${agency.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
          SizedBox(height: 8),
          if (agency.equipments.isNotEmpty) ...[
            Text(
              'Equipments available:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 4),
            for (String equipment in agency.equipments)
              Text('- $equipment'),
          ],
        ],
      ),
    );
  }
}
*/















import 'package:flutter/material.dart';

import 'AllPages.dart';
import 'Profile.dart';
import 'about.dart';

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final TextEditingController _textEditingController = TextEditingController();

  List<Agency> agencies = [
    Agency('Agency 1', ['Medicines', 'First Aid Kit', 'Ambulances', 'Clothes', 'Irons']),
    Agency('Agency 2', ['First Aid Kit', 'Ambulances', 'Clothes']),
    Agency('Agency 3', ['Medicines', 'Ambulances', 'Irons']),
    Agency('Agency 4', ['Ambulances']),
    Agency('Agency 5', ['Medicines', 'Clothes', 'Irons']),
    Agency('Agency 6', ['Medicines', 'Clothes', 'Irons']),
    Agency('Agency 7', ['First Aid Kit', 'Ambulances']),
    Agency('Agency 8', ['Medicines', 'Ambulances']),
  ];

  List<Agency> filteredAgencies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Page'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'All Agency details available here...',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _textEditingController,
              onChanged: (value) {
                filterAgencies(value);
              },
              decoration: InputDecoration(
                hintText: 'Enter your search query',
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Search Button Pressed. Query: ${_textEditingController.text}');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                    ),
                    child: Icon(Icons.search),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _textEditingController.text.isEmpty
                    ? agencies.length
                    : filteredAgencies.length,
                itemBuilder: (context, index) {
                  return AgencyBox(
                    agency: _textEditingController.text.isEmpty
                        ? agencies[index]
                        : filteredAgencies[index],
                    showEquipmentDetails: _showEquipmentDetailsDialog,
                  );
                },
              ),
            ),
          ],
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
        currentIndex: 0,
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

  void filterAgencies(String query) {
    setState(() {
      filteredAgencies = agencies
          .where((agency) =>
      agency.name.toLowerCase().contains(query.toLowerCase()) ||
          agency.equipments
              .any((equipment) => equipment.toLowerCase().contains(query.toLowerCase())))
          .toList();
    });
  }

  void _showEquipmentDetailsDialog(Agency agency) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Equipment Details - ${agency.name}'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Equipments available:'),
              SizedBox(height: 8),
              for (String equipment in agency.equipments)
                Text('- $equipment: ${_getEquipmentCount(agency, equipment)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  int _getEquipmentCount(Agency agency, String equipment) {
    return agency.equipments.where((e) => e == equipment).length;
  }
}

class Agency {
  final String name;
  final List<String> equipments;

  Agency(this.name, this.equipments);
}

class AgencyBox extends StatelessWidget {
  final Agency agency;
  final Function(Agency) showEquipmentDetails;

  AgencyBox({required this.agency, required this.showEquipmentDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              showEquipmentDetails(agency);
            },
            child: Text(
              'Rescue Agency: ${agency.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
          SizedBox(height: 8),
          if (agency.equipments.isNotEmpty) ...[
            Text(
              'Equipments available:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 4),
            for (String equipment in agency.equipments)
              Text('- $equipment'),
          ],
        ],
      ),
    );
  }
}
