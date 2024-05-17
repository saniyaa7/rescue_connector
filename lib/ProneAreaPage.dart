import 'package:flutter/material.dart';
import 'AllPages.dart';
import 'Profile.dart';

class ProneAreaPage extends StatefulWidget {
  const ProneAreaPage({Key? key}) : super(key: key);

  @override
  _ProneAreaPageState createState() => _ProneAreaPageState();
}

class _ProneAreaPageState extends State<ProneAreaPage> {
  List<Map<String, List<String>>> proneAreas = [];

  @override
  void initState() {
    super.initState();
    // Setting up default prone areas
    _setDefaultProneAreas();
  }

  void _setDefaultProneAreas() {
    // Hardcoded prone areas (for demonstration)
    // Prone Area 1
    List<String> taskForce1Hospitals = ['Task Force Medical: Delhi Max Super Speciality Hospital', 'Task Force Fire Brigade: Delhi Fire Service (Government of NCT of Delhi)', 'Task Force Police: Delhi Police'];

    Map<String, List<String>> proneArea1 = {
      'Task Force 1': taskForce1Hospitals,
    };

    // Prone Area 2
    List<String> taskForce2Hospitals = ['Task Force Medical: Wockhardt Hospitals, Mumbai Central', 'Task Force Fire Brigade: Mumbai Fire Brigade', 'Task Force Police: Mumbai Police'];

    Map<String, List<String>> proneArea2 = {
      'Task Force 2': taskForce2Hospitals,
    };

    // Prone Area 3
    List<String> taskForce3Hospitals = ['Task Force Medical: Kerala Herb and Care', 'Task Force Fire Brigade: Kerala Fire Services', 'Task Force Police: Kerala Public Police'];

    Map<String, List<String>> proneArea3 = {
      'Task Force 3': taskForce3Hospitals,
    };

    // Adding default prone areas to the list
    proneAreas.add(proneArea1);
    proneAreas.add(proneArea2);
    proneAreas.add(proneArea3);
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
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
            backgroundColor: Colors.transparent, // Make app bar transparent
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: proneAreas.length,
        itemBuilder: (context, index) {
          return _buildProneArea(
            title: 'Prone Area ${index + 1}',
            data: proneAreas[index],
          );
        },
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
            _buildSection(title: entry.key, items: entry.value),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<String> items,
  }) {
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
        for (var item in items)
          ListTile(
            title: Text(item),
          ),
      ],
    );
  }

  void _showTaskForceCreationPopup(BuildContext context) {
    String taskForceName = '';
    String agencyNames = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Task Force Creation"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    taskForceName = value;
                  },
                  decoration: InputDecoration(
                    labelText: "Enter Task Force Name",
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    agencyNames = value;
                  },
                  decoration: InputDecoration(
                    labelText: "Enter Agency Names",
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
                // Implement adding task force to prone area list
                setState(() {
                  _addTaskForce(taskForceName, agencyNames);
                });
                Navigator.of(context).pop();
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _addTaskForce(String taskForceName, String agencyNames) {
    List<String> agencies = agencyNames.split(',');
    Map<String, List<String>> newProneArea = {
      'Task Force ${proneAreas.length + 1}: $taskForceName': agencies,
    };
    proneAreas.add(newProneArea);
  }
}
