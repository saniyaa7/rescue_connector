import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:first/screens/signin.dart';
import 'config.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _organizationIdController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _areaOfExpertiseController = TextEditingController();
  TextEditingController _numberOfMembersController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _latitudeController = TextEditingController();
  TextEditingController _longitudeController = TextEditingController();
  TextEditingController _equipmentsController = TextEditingController();
  TextEditingController _medicalRequirementsController =
      TextEditingController();
  TextEditingController _communicationEquipmentsController =
      TextEditingController();
  TextEditingController _shelterAndNecessitiesController =
      TextEditingController();

  double? _latitude;
  double? _longitude;

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Location services are disabled.'),
        ),
      );
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Location permissions are denied.'),
          ),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Location permissions are permanently denied.'),
        ),
      );
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _latitude = position.latitude;
      _longitude = position.longitude;
      _latitudeController.text = _latitude.toString();
      _longitudeController.text = _longitude.toString();
      _locationController.text = '';
    });
  }

  Future<void> _signUp() async {
    final String organizationId = _organizationIdController.text;
    final String username = _userNameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String mobileNumber = _mobileNumberController.text;
    final String areaOfExpertise = _areaOfExpertiseController.text;
    final String numberOfMembers = _numberOfMembersController.text;
    final String location = _locationController.text;
    final String latitude = _latitudeController.text;
    final String longitude = _longitudeController.text;
    final String equipments = _equipmentsController.text;
    final String medicalRequirements = _medicalRequirementsController.text;
    final String communicationEquipments =
        _communicationEquipmentsController.text;
    final String shelterAndNecessities = _shelterAndNecessitiesController.text;

    final String url = '${Config.apiUrl}/signup';

    if (password.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password must be at least 8 characters long.'),
        ),
      );
      return;
    }

    if (mobileNumber.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Mobile number must be 10 digits.'),
        ),
      );
      return;
    }

    if (_latitude == null || _longitude == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Location not determined. Please try again.'),
        ),
      );
      return;
    }

    try {
      Map<String, dynamic> data = {
        'organization_id': organizationId,
        'username': username,
        'email': email,
        'password': password,
        'mobileNumber': mobileNumber,
        'areaOfExpertise': areaOfExpertise,
        'numberOfMembers': numberOfMembers,
        'location': location,
        'latitude': latitude,
        'longitude': longitude,
        'equipments': equipments,
        'medicalRequirements': medicalRequirements,
        'communicationEquipments': communicationEquipments,
        'shelterAndNecessities': shelterAndNecessities,
      };

      final http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        print('User signed up successfully!');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignIn()),
        );
      } else {
        print('Error: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign-up failed. Please try again.'),
          ),
        );
      }
    } catch (e) {
      print('Exception occurred: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again later.'),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF5E35B1),
              Color(0xFF3F51B5),
              Color(0xFF2196F3),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20),
              TextField(
                controller: _organizationIdController,
                decoration: InputDecoration(
                  labelText: "Enter organizationID",
                  prefixIcon: Icon(Icons.person_outline),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _userNameController,
                decoration: InputDecoration(
                  labelText: "Enter UserName",
                  prefixIcon: Icon(Icons.person_outline),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Enter Email Id",
                  prefixIcon: Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Enter Password(min. 8 characters)",
                  prefixIcon: Icon(Icons.lock_outlined),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _mobileNumberController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Mobile Number(10 digit)",
                  prefixIcon: Icon(Icons.phone),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _areaOfExpertiseController,
                decoration: InputDecoration(
                  labelText: "Area of Expertise",
                  prefixIcon: Icon(Icons.business),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _numberOfMembersController,
                decoration: InputDecoration(
                  labelText: "Number of Members",
                  prefixIcon: Icon(Icons.people),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(
                  labelText: "Location",
                  prefixIcon: Icon(Icons.location_on),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _latitudeController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Latitude",
                  prefixIcon: Icon(Icons.location_on),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _longitudeController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Longitude",
                  prefixIcon: Icon(Icons.location_on),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _equipmentsController,
                decoration: InputDecoration(
                  labelText: "Equipments - Eg. Drone, Camera",
                  prefixIcon: Icon(Icons.business),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _medicalRequirementsController,
                decoration: InputDecoration(
                  labelText:
                      "Medical Requirements - Eg. First Aid Kit, Stretchers",
                  prefixIcon: Icon(Icons.healing),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _communicationEquipmentsController,
                decoration: InputDecoration(
                  labelText: "Communication Equipments - Eg. Satellites, Phone",
                  prefixIcon: Icon(Icons.phone),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _shelterAndNecessitiesController,
                decoration: InputDecoration(
                  labelText: "Shelter and Basic Necessities - Eg. Food, Water",
                  prefixIcon: Icon(Icons.home),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signUp,
                child: Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
