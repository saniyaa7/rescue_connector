// import 'package:flutter/material.dart';
//
// class TaskForceCreation extends StatefulWidget {
//   const TaskForceCreation({Key? key}) : super(key: key);
//
//   @override
//   _TaskForceCreationState createState() => _TaskForceCreationState();
// }
//
// class _TaskForceCreationState extends State<TaskForceCreation> {
//   List<Map<String, List<String>>> taskForces = [];
//
//   @override
//   void initState() {
//     super.initState();
//     // Setting up default task forces
//     _setDefaultTaskForces();
//   }
//
//   void _setDefaultTaskForces() {
//     // Task Force 1 for Delhi
//     List<String> delhiMedical = ['Delhi Max Super Speciality Hospital'];
//     List<String> delhiFireBrigade = [
//       'Delhi Fire Service (Government of NCT of Delhi)'
//     ];
//     List<String> delhiPolice = ['Delhi Police'];
//
//     Map<String, List<String>> taskForce1 = {
//       'Medical': delhiMedical,
//       'Fire Brigade': delhiFireBrigade,
//       'Police': delhiPolice,
//     };
//
//     // Task Force 2 for Mumbai
//     List<String> mumbaiMedical = [
//       'Wockhardt Hospitals, Mumbai Central',
//       'Infiniti Fire & Safety Solutions'
//     ];
//     List<String> mumbaiFireBrigade = [
//       'Mumbai Fire Brigade'
//     ]; // Update with the correct Mumbai Fire Brigade name
//     List<String> mumbaiPolice = ['Mumbai Police'];
//
//     Map<String, List<String>> taskForce2 = {
//       'Medical': mumbaiMedical,
//       'Fire Brigade': mumbaiFireBrigade,
//       'Police': mumbaiPolice,
//     };
//
//     // Task Force 3 for Kerala
//     List<String> keralaMedical = ['Kerala Herb and Care'];
//     List<String> keralaFireBrigade = ['Kerala Fire Services'];
//     List<String> keralaPolice = ['Kerala Public Police'];
//
//     Map<String, List<String>> taskForce3 = {
//       'Medical': keralaMedical,
//       'Fire Brigade': keralaFireBrigade,
//       'Police': keralaPolice,
//     };
//
//     // Adding default task forces to the list
//     taskForces.add(taskForce1);
//     taskForces.add(taskForce2);
//     taskForces.add(taskForce3);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Task Force Creation'),
//       ),
//       backgroundColor: Colors.grey[200],
//       body: ListView.builder(
//         itemCount: taskForces.length,
//         itemBuilder: (context, index) {
//           return _buildTaskForce(
//             title: 'Task Force ${index + 1}',
//             departments: taskForces[index],
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildTaskForce({
//     required String title,
//     required Map<String, List<String>> departments,
//   }) {
//     return Card(
//       margin: const EdgeInsets.all(8.0),
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       color: Colors.white,
//       child: ExpansionTile(
//         title: Text(
//           title,
//           style: const TextStyle(
//             color: Colors.indigo,
//             fontSize: 18.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         children: [
//           for (var entry in departments.entries)
//             _buildSection(title: entry.key, departments: entry.value),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSection({
//     required String title,
//     required List<String> departments,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             title,
//             style: const TextStyle(
//               color: Colors.indigo,
//               fontWeight: FontWeight.bold,
//               fontSize: 16.0,
//             ),
//           ),
//         ),
//         for (var department in departments)
//           ListTile(
//             title: Text(department),
//           ),
//       ],
//     );
//   }
// }





import 'package:flutter/material.dart';

import 'AllPages.dart';
import 'about.dart';

class TaskForceCreation extends StatefulWidget {
  const TaskForceCreation({Key? key}) : super(key: key);

  @override
  _TaskForceCreationState createState() => _TaskForceCreationState();
}

class _TaskForceCreationState extends State<TaskForceCreation> {
  List<Map<String, List<String>>> taskForces = [];

  @override
  void initState() {
    super.initState();
    // Setting up default task forces
    _setDefaultTaskForces();
  }

  void _setDefaultTaskForces() {
    // Task Force 1 for Delhi
    List<String> delhiMedical = ['Delhi Max Super Speciality Hospital'];
    List<String> delhiFireBrigade = [
      'Delhi Fire Service (Government of NCT of Delhi)'
    ];
    List<String> delhiPolice = ['Delhi Police'];

    Map<String, List<String>> taskForce1 = {
      'Medical': delhiMedical,
      'Fire Brigade': delhiFireBrigade,
      'Police': delhiPolice,
    };

    // Task Force 2 for Mumbai
    List<String> mumbaiMedical = [
      'Wockhardt Hospitals, Mumbai Central',
      'Infiniti Fire & Safety Solutions'
    ];
    List<String> mumbaiFireBrigade = [
      'Mumbai Fire Brigade'
    ]; // Update with the correct Mumbai Fire Brigade name
    List<String> mumbaiPolice = ['Mumbai Police'];

    Map<String, List<String>> taskForce2 = {
      'Medical': mumbaiMedical,
      'Fire Brigade': mumbaiFireBrigade,
      'Police': mumbaiPolice,
    };

    // Task Force 3 for Kerala
    List<String> keralaMedical = ['Kerala Herb and Care'];
    List<String> keralaFireBrigade = ['Kerala Fire Services'];
    List<String> keralaPolice = ['Kerala Public Police'];

    Map<String, List<String>> taskForce3 = {
      'Medical': keralaMedical,
      'Fire Brigade': keralaFireBrigade,
      'Police': keralaPolice,
    };

    // Adding default task forces to the list
    taskForces.add(taskForce1);
    taskForces.add(taskForce2);
    taskForces.add(taskForce3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Force Creation'),
      ),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: taskForces.length,
        itemBuilder: (context, index) {
          return _buildTaskForce(
            title: 'Task Force ${index + 1}',
            departments: taskForces[index],
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
        currentIndex: 2, // Index 2 corresponds to the current page (TaskForceCreation)
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
            // Stay on the current page (TaskForceCreation)
          }
        },
      ),
    );
  }

  Widget _buildTaskForce({
    required String title,
    required Map<String, List<String>> departments,
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
          for (var entry in departments.entries)
            _buildSection(title: entry.key, departments: entry.value),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<String> departments,
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
        for (var department in departments)
          ListTile(
            title: Text(department),
          ),
      ],
    );
  }
}
