import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:session/session.dart';

class Organization {
  final int organizationId;
  final String username;
  final String email;
  final String mobileNumber;
  final String areaOfExpertise;
  final int numberOfMembers;
  final String location;
  final String equipment;
  final String medicalRequirements;
  final String communication;
  final String shelterAndNecessity;

  Organization({
    required this.organizationId,
    required this.username,
    required this.email,
    required this.mobileNumber,
    required this.areaOfExpertise,
    required this.numberOfMembers,
    required this.location,
    required this.equipment,
    required this.medicalRequirements,
    required this.communication,
    required this.shelterAndNecessity,
  });
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Organization> organizations = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      print(await SessionManager().get("email"));
      final response = await http.post(
        Uri.parse('http://localhost:3000/api/auth/data_profile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'email': await SessionManager().get("email")}),
      ); // Use port 3000


      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Fetched data: $data');

        setState(() {
          organizations = data.map<Organization>((orgData) {
            return Organization(
              organizationId: orgData['organization_id'],
              username: orgData['username'],
              email: orgData['email'],
              mobileNumber: orgData['mobileNumber'],
              areaOfExpertise: orgData['area_of_expertise'],
              numberOfMembers: orgData['number_of_members'],
              location: orgData['location'],
              equipment: orgData['equipment'],
              medicalRequirements: orgData['medical_requirements'],
              communication: orgData['communication'],
              shelterAndNecessity: orgData['shelter_and_necessity'],
            );
          }).toList();
        });
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
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
          'Profile',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
      ),

      body: organizations.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: organizations.length,
              itemBuilder: (context, index) {
                return OrganizationCard(organization: organizations[index]);
              },
            ),
    );
  }
}

class OrganizationCard extends StatelessWidget {
  final Organization organization;

  OrganizationCard({required this.organization});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center the content
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar( // Add image in a round shape
              radius: 50,
              backgroundImage: AssetImage('assets/images/rescue_team_image.jpeg'), // Provide path to your image
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Organization ID: ${organization.organizationId}', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Username: ${organization.username}'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Email: ${organization.email}'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('mobileNumber: ${organization.mobileNumber}'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Area of Expertise: ${organization.areaOfExpertise}'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Number of Members: ${organization.numberOfMembers}'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Location: ${organization.location}'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Equipment: ${organization.equipment}'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Medical Requirements: ${organization.medicalRequirements}'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Communication: ${organization.communication}'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Shelter and Necessities: ${organization.shelterAndNecessity}'),
          ),
        ],
      ),
    );
  }
}




