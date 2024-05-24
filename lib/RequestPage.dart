import 'package:flutter/material.dart';
import './map_functionality/map.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:first/Profile.dart';
import 'AllPages.dart';
import 'about.dart';
import '/screens/config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RequestPage(),
      routes: {
        '/mapView': (context) => MapView(
              latitude: 0.0,
              longitude: 0.0,
            ),
      },
    );
  }
}

class Organization {
  final int organization_id;
  final String equipment;
  final String medical_requirements;
  final String communication;
  final String shelter_and_necessity;
  final double latitude;
  final double longitude;

  Organization({
    required this.organization_id,
    required this.equipment,
    required this.medical_requirements,
    required this.communication,
    required this.shelter_and_necessity,
    required this.latitude,
    required this.longitude,
  });
}

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  int _currentIndex = 0;
  List<Organization> organizations = [];
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  final String url = '${Config.apiUrl}/data';
  final String notificationUrl = '${Config.notificationUrl}/sendNotification';

  @override
  void initState() {
    super.initState();
    fetchData();
    sortNearestAgenciesByLocation();
  }

  Future<void> sortNearestAgenciesByLocation() async {
    try {
      final coordinates = await fetchCoordinates();
      final latitude = coordinates['latitude'];
      final longitude = coordinates['longitude'];
      await getNearestLocations(latitude, longitude);
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<Map<String, dynamic>> fetchCoordinates() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return {'latitude': position.latitude, 'longitude': position.longitude};
  }

  Future<void> getNearestLocations(double latitude, double longitude) async {
    final response = await http.get(Uri.parse(
        '${Config.apiUrl}/nearest-agencies?latitude=$latitude&longitude=$longitude'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('Fetched data: $data');
      setState(() {
        organizations = data
            .map<Organization>((orgData) => Organization(
                  organization_id: orgData['organization_id'],
                  equipment: orgData['equipment'],
                  medical_requirements: orgData['medical_requirements'],
                  communication: orgData['communication'],
                  shelter_and_necessity: orgData['shelter_and_necessity'],
                  latitude: double.parse(orgData['latitude'].toString()),
                  longitude: double.parse(orgData['longitude'].toString()),
                ))
            .toList();
        organizations = organizations.reversed.toList();
      });
      print(response.body);
    } else {
      print('Failed to get nearest locations: ${response.statusCode}');
    }
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Fetched data: $data');
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<http.Response> sendNotification(
      double latitude, double longitude) async {
    final response = await http.post(
      Uri.parse(notificationUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'latitude': latitude,
        'longitude': longitude,
      }),
    );
    return response;
  }

  List<Organization> filterOrganizations() {
    if (_searchQuery.isEmpty) {
      return organizations;
    } else {
      return organizations.where((org) {
        return org.equipment
                .toLowerCase()
                .contains(_searchQuery.toLowerCase()) ||
            org.medical_requirements
                .toLowerCase()
                .contains(_searchQuery.toLowerCase()) ||
            org.communication
                .toLowerCase()
                .contains(_searchQuery.toLowerCase()) ||
            org.shelter_and_necessity
                .toLowerCase()
                .contains(_searchQuery.toLowerCase());
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
          'Request for Resources',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter equipment name',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: filterOrganizations().isEmpty
                ? Center(
                    child: Text('No results found'),
                  )
                : ListView.builder(
                    itemCount: filterOrganizations().length,
                    itemBuilder: (context, index) {
                      return OrganizationCard(
                        organization: filterOrganizations()[index],
                        onAlert: (latitude, longitude) =>
                            showAlert(context, latitude, longitude),
                      );
                    },
                  ),
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

  void showAlert(BuildContext context, double latitude, double longitude) {
    sendNotification(latitude, longitude).then((response) {
      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Alert Sent'),
              content: Text('Alert has been sent successfully.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MapView(latitude: latitude, longitude: longitude),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        );
      } else {
        showErrorDialog(context, 'Failed to send alert');
      }
    }).catchError((error) {
      showErrorDialog(context, 'An error occurred while sending alert');
    });
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

class OrganizationCard extends StatelessWidget {
  final Organization organization;
  final Function(double, double) onAlert;

  OrganizationCard({required this.organization, required this.onAlert});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Organization ID: ${organization.organization_id}',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Equipment: ${organization.equipment}'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                'Medical Requirements: ${organization.medical_requirements}'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Communication: ${organization.communication}'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                'Shelter and Necessities: ${organization.shelter_and_necessity}'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () =>
                  onAlert(organization.latitude, organization.longitude),
              child: Text('Send Alert'),
            ),
          ),
        ],
      ),
    );
  }
}
