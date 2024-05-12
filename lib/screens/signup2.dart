// import 'package:flutter/material.dart';
// import 'package:first/reusable_widget/reusable_widget.dart';
// import 'package:first/AllPages.dart';
// import 'package:first/screens/signin.dart';
// import 'package:first/utils/colors.dart';

// class SignUpScreen1 extends StatefulWidget {
//   const SignUpScreen1({Key? key}) : super(key: key);

//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen1> {
//   TextEditingController _userNameTextController = TextEditingController();
//   TextEditingController _emailTextController = TextEditingController();
//   TextEditingController _passwordTextController = TextEditingController();
//   TextEditingController _equipmentsController = TextEditingController();
//   TextEditingController _medicalRequirementsController = TextEditingController();
//   TextEditingController _communicationEquipmentsController = TextEditingController();
//   TextEditingController _shelterAndNecessitiesController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text(
//           "Sign Up",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFF5E35B1), // Deep Purple
//               Color(0xFF3F51B5), // Indigo
//               Color(0xFF2196F3), // Blue
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
//             child: Column(
//               children: <Widget>[
//                 const SizedBox(height: 20),
//                 reusableTextField(
//                   "Equipments - Eg. Drone, Camera",
//                   Icons.business,
//                   false,
//                   _equipmentsController,
//                 ),
//                 const SizedBox(height: 20),
//                 reusableTextField(
//                   "Medical Requirements - Eg. First Aid Kit, Stretchers",
//                   Icons.healing,
//                   false,
//                   _medicalRequirementsController,
//                 ),
//                 const SizedBox(height: 20),
//                 reusableTextField(
//                   "Communication Equipments - Eg. Satellites, Phone",
//                   Icons.phone,
//                   false,
//                   _communicationEquipmentsController,
//                 ),
//                 const SizedBox(height: 20),
//                 reusableTextField(
//                   "Shelter and Basic Necessities - Eg. Food, Water",
//                   Icons.home,
//                   false,
//                   _shelterAndNecessitiesController,
//                 ),
//                 const SizedBox(height: 20),
//                 registerButton(context),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget registerButton(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         // Perform registration logic here
//         // For now, navigate to the HomeScreen
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) =>MyApp()),
//         );
//       },
//       style: ElevatedButton.styleFrom(
//         primary: Colors.white,
//         onPrimary: Colors.indigo,
//         padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//       ),
//       child: Text(
//         "Register",
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }

// Color hexStringToColor(String hexColor) {
//   int intValue = int.parse(hexColor, radix: 16);
//   return Color(intValue).withOpacity(1.0);
// }
