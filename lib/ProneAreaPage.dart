import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import '/screens/config.dart';
import 'package:flutter_sms/flutter_sms.dart';

class Organization {
  final int organization_id;
  final String equipment;
  final String medical_requirements;
  final String communication;
  final String shelter_and_necessity;
  final String location;
  final double latitude;
  final double longitude;

  Organization({
    required this.organization_id,
    required this.equipment,
    required this.medical_requirements,
    required this.communication,
    required this.shelter_and_necessity,
    required this.location,
    required this.latitude,
    required this.longitude,
  });
}

class ProneAreaPage extends StatefulWidget {
  const ProneAreaPage({Key? key}) : super(key: key);

  @override
  _ProneAreaPageState createState() => _ProneAreaPageState();
}

class _ProneAreaPageState extends State<ProneAreaPage> {
  List<Map<String, List<String>>> proneAreas = [];
  List<Organization> organizations = [];
  String selectedCity = 'All';
  TextEditingController searchController = TextEditingController();
  final taskForceUrl = '${Config.apiUrl}/task-forces';
  final usersUrl = '${Config.apiUrl}/data-with-task-force';
  final updateTaskForceUrl = '${Config.apiUrl}/update-task-force';

  @override
  void initState() {
    super.initState();
    _setDefaultProneAreas();
    sortNearestAgenciesByLocation(selectedCity);
  }

  void _setDefaultProneAreas() async {
    try {
      final taskForceResponse = await http.get(Uri.parse(taskForceUrl));
      if (taskForceResponse.statusCode == 200) {
        final taskForceData = json.decode(taskForceResponse.body);

        print(taskForceData);
        for (final taskForce in taskForceData) {
          if (taskForce is Map<String, dynamic>) {
            final taskForceName = taskForce['name'];
            final List<String> users = [];

            final usersResponse = await http
                .get(Uri.parse('$usersUrl?task_force_name="${taskForceName}"'));
            if (usersResponse.statusCode == 200) {
              final userData = json.decode(usersResponse.body);
              if (userData != null &&
                  userData['data_with_task_force'] != null) {
                final List<dynamic> userList = userData['data_with_task_force'];

                for (final user in userList) {
                  final String username = user['username'];

                  final String expertise = user['area_of_expertise'];
                  final String location = user['location'];
                  final String phone = user['mobileNumber'];
                  users.add(
                      '$username\nExpertise: $expertise\nPhone Number: $phone\nLocation: $location');
                }
              } else {
                print('Invalid or missing user data in the response');
              }
            } else {
              print(
                  'Failed to fetch users for task force $taskForceName: ${usersResponse.statusCode}');
            }

            proneAreas.add({taskForceName: users});
          } else {
            print('Invalid task force data found: $taskForce');
          }
        }

        setState(() {});
      } else {
        print('Failed to fetch task forces: ${taskForceResponse.statusCode}');
      }
    } catch (e) {
      print('Error fetching task forces and users: $e');
    }
  }

  Future<void> sortNearestAgenciesByLocation(String city) async {
    try {
      final coordinates = await fetchCoordinates();
      final latitude = coordinates['latitude'];
      final longitude = coordinates['longitude'];
      await getNearestLocations(latitude, longitude, city);
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

  Future<void> getNearestLocations(
      double latitude, double longitude, String city) async {
    final response = await http.get(
      Uri.parse(
          '${Config.apiUrl}/nearest-agencies?latitude=$latitude&longitude=$longitude&city=$city'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('Fetched data: $data');
      setState(() {
        organizations = (data as List).map((orgData) {
          return Organization(
            organization_id: orgData['organization_id'],
            equipment: orgData['equipment'],
            medical_requirements: orgData['medical_requirements'],
            communication: orgData['communication'],
            shelter_and_necessity: orgData['shelter_and_necessity'],
            location: orgData['location'],
            latitude: orgData['latitude'],
            longitude: orgData['longitude'],
          );
        }).toList();
        organizations = organizations.reversed.toList();
      });
    } else {
      print('Failed to get nearest locations: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2196F3), //  Blue
                Color(0xFF3F51B5), // Indigo
                Color(0xFF5E35B1), // Deep Purple
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: AppBar(
            title: const Text(
              'Prone Area Page',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: proneAreas.length,
              itemBuilder: (context, index) {
                return _buildProneArea(
                  title: 'Prone Area ${index + 1}',
                  data: proneAreas[index],
                  selectedCity: selectedCity,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ElevatedButton(
            onPressed: () {
              _showTaskForceCreationPopup(context);
            },
            child: Text('Create New Task Force'),
          ),
        ),
      ),
    );
  }

  Widget _buildProneArea({
    required String title,
    required Map<String, List<String>> data,
    required String selectedCity,
  }) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.indigo,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          for (var entry in data.entries)
            _buildSection(
              title: entry.key,
              items: entry.value,
              selectedCity: selectedCity,
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    List<String> phoneNumbers = [];
                    for (var entry in data.entries) {
                      for (var user in entry.value) {
                        print("==============${user}");
                        // Extract phone numbers from the user details
                        var phoneNumber = extractPhoneNumber(user);
                        if (phoneNumber != null) {
                          phoneNumbers.add(phoneNumber);
                        }
                      }
                    }
                    String message = _constructMessage(title, data);
                    _sendSMS(phoneNumbers, message);
                  },
                  child: Text('Send Alert'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _constructMessage(String title, Map<String, List<String>> data) {
    String members = '';
    for (var entry in data.entries) {
      members += '${entry.key}:\n';
      for (var user in entry.value) {
        members += '$user\n';
      }
    }
    String message =
        "You have been added to the task force '$title'. Members present:\n$members";
    return message;
  }

  String? extractPhoneNumber(String userDetail) {
    // Regular expression to find the phone number following the "Phone Number:" pattern
    RegExp regExp = RegExp(r'Phone Number:\s*(\d{10})');
    Match? match = regExp.firstMatch(userDetail);
    if (match != null) {
      return match.group(1); // Return the phone number (first capturing group)
    }
    return null;
  }

  Widget _buildSection({
    required String title,
    required List<String> items,
    required String selectedCity,
  }) {
    List<String> filteredItems = selectedCity == 'All'
        ? items
        : items.where((item) => item.contains(selectedCity)).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.indigo,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
        for (var item in filteredItems)
          ListTile(
            title: Text(item),
          ),
      ],
    );
  }

  void _showTaskForceCreationPopup(BuildContext context) {
    String taskForceName = '';
    List<String> selectedAgencies = [];
    Map<int, bool> selectedOrganizationIds = {};
    String? selectedFilter = 'All';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text("Task Force Creation"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (value) {
                        taskForceName = value;
                      },
                      decoration: InputDecoration(
                        labelText: "Enter Task Force Name",
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Select Agencies",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildAgencyFilterDropdown(selectedFilter!, (newValue) {
                      setState(() {
                        selectedFilter = newValue;
                      });
                    }),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      child: Column(
                        children: organizations.where((org) {
                          if (selectedFilter == 'All') return true;
                          return org.location.contains(selectedFilter!);
                        }).map((org) {
                          return ListTile(
                            title: AgencyDetails(
                              organization: org,
                              isSelected: selectedOrganizationIds[
                                      org.organization_id] ??
                                  false,
                              onCheckboxChanged: () {
                                setState(() {
                                  bool isSelected = selectedOrganizationIds[
                                          org.organization_id] ??
                                      false;
                                  selectedOrganizationIds[org.organization_id] =
                                      !isSelected;
                                  if (isSelected) {
                                    selectedAgencies
                                        .remove(org.organization_id.toString());
                                  } else {
                                    selectedAgencies
                                        .add(org.organization_id.toString());
                                  }
                                });
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Close"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _addTaskForce(taskForceName, selectedAgencies);
                    Navigator.of(context).pop();
                  },
                  child: Text("Add"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildAgencyFilterDropdown(
      String selectedValue, void Function(String?)? onChanged) {
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: onChanged,
      items: [
        DropdownMenuItem(
          value: 'All',
          child: Text('All'),
        ),
        DropdownMenuItem(
          value: 'Solapur',
          child: Text('Solapur'),
        ),
        DropdownMenuItem(
          value: 'Mumbai',
          child: Text('Mumbai'),
        ),
        DropdownMenuItem(
          value: 'Pune',
          child: Text('Pune'),
        ),
        DropdownMenuItem(
          value: 'Sangli',
          child: Text('Sangli'),
        ),
      ],
    );
  }

  void _addTaskForce(
    String taskForceName,
    List<String> selectedAgencies,
  ) async {
    if (taskForceName.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Task force name cannot be empty."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      return;
    }

    try {
      final taskForceResponse = await http.post(
        Uri.parse(taskForceUrl),
        body: json.encode({'name': taskForceName}),
        headers: {'Content-Type': 'application/json'},
      );
      if (taskForceResponse.statusCode == 200) {
        final taskId = json.decode(taskForceResponse.body)['organization_id'];

        bool updateFailed = false;
        for (final agencyId in selectedAgencies) {
          final updateResponse = await http.put(
            Uri.parse(updateTaskForceUrl),
            body: json.encode({
              'organization_id': agencyId,
              'task_force_name': taskForceName
            }),
            headers: {'Content-Type': 'application/json'},
          );

          if (updateResponse.statusCode != 200) {
            print('Failed to update task force name for user $agencyId');
            updateFailed = true;

            final deleteResponse = await http.delete(
              Uri.parse(taskForceUrl),
              body: json.encode({
                'name': taskForceName,
              }),
              headers: {'Content-Type': 'application/json'},
            );

            if (deleteResponse.statusCode == 200) {
              print('Task force deleted successfully.');
            } else {
              print(
                  'Failed to delete task force: ${deleteResponse.statusCode}');
            }
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Alert"),
                  content: Text(
                      "Agency $agencyId is already in another task force."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("OK"),
                    ),
                  ],
                );
              },
            );
            break;
          }
        }

        if (!updateFailed) {}
      } else if (taskForceResponse.statusCode == 500) {
        print('Task force name already exists');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Alert"),
              content: Text("Task force name already exists"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      } else {
        print('Failed to create task force: ${taskForceResponse.statusCode}');
      }
    } catch (e) {
      print('Error adding task force: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Something went wrong. Please try again later."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  _sendSMS(List<String> recipients, String message) async {
    try {
      String _result = await sendSMS(
          message: message, recipients: recipients, sendDirect: true);
      print(_result);
      print(message);
      // Show success dialogue if the SMS is sent successfully
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success"),
            content: Text("Message sent successfully!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } catch (onError) {
      print(onError);
    }
  }
}

class AgencyDetails extends StatelessWidget {
  final Organization organization;
  final bool isSelected;
  final VoidCallback onCheckboxChanged;

  AgencyDetails({
    required this.organization,
    required this.isSelected,
    required this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        children: [
          Checkbox(
            value: isSelected,
            onChanged: (value) {
              onCheckboxChanged();
            },
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  organization.equipment,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Equipment: ${organization.equipment}'),
                Text(
                    'Medical Requirements: ${organization.medical_requirements}'),
                Text(
                    'Shelter & Necessities: ${organization.shelter_and_necessity}'),
                Text('Location: ${organization.location}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
