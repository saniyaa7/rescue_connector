// // SignIn.dart
// /*
// import 'package:flutter/material.dart';
// import 'package:first/screens/signup.dart';
// import '../main.dart';
// import 'package:first/AllPages.dart'; // Import AllPages.dart
//
// class SignIn extends StatefulWidget {
//   const SignIn({Key? key});
//
//   @override
//   State<SignIn> createState() => _SignInState();
// }
//
// class _SignInState extends State<SignIn> {
//   TextEditingController _passwordTextController = TextEditingController();
//   TextEditingController _emailTextController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//             padding: EdgeInsets.fromLTRB(
//                 20, MediaQuery.of(context).size.height * 0.1, 20, 0),
//             child: Column(
//               children: <Widget>[
//                 // ... rest of the code ...
//
//                 signUpOption(),
//                 emergencyButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Row signUpOption() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text("Don't have an account?",
//             style: TextStyle(color: Colors.white70)),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => SignUpScreen()));
//           },
//           child: const Text(
//             " Sign Up",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         )
//       ],
//     );
//   }
//
//   Widget signInSignUpButton(BuildContext context, bool isSignIn, VoidCallback onPressed) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         primary: Colors.white, // Customize button color
//         onPrimary: Colors.blue, // Customize text color
//         padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//       ),
//       child: Text(
//         isSignIn ? "Sign In" : "Sign Up",
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
//
//   Widget emergencyButton() {
//     return ElevatedButton(
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => MyApp1()),
//         );
//       },
//       style: ElevatedButton.styleFrom(
//         primary: Colors.red,
//         onPrimary: Colors.white,
//         padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//       ),
//       child: Text(
//         "Emergency",
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }
//
// Color hexStringToColor(String hexColor) {
//   int intValue = int.parse(hexColor, radix: 16);
//   return Color(intValue).withOpacity(1.0);
// }
// */
//
//
//
// import 'package:flutter/material.dart';
// import 'package:first/screens/home.dart';
// import 'package:first/screens/signup.dart';
// import 'package:first/user_end/user_end.dart';
// import 'package:first/utils/colors.dart';
// import 'package:first/reusable_widget/reusable_widget.dart';
//
// import '../main.dart';
//
// class SignIn extends StatefulWidget {
//   const SignIn({Key? key});
//
//   @override
//   State<SignIn> createState() => _SignInState();
// }
//
// class _SignInState extends State<SignIn> {
//   TextEditingController _passwordTextController = TextEditingController();
//   TextEditingController _emailTextController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//             padding: EdgeInsets.fromLTRB(
//                 20, MediaQuery.of(context).size.height * 0.1, 20, 0),
//             child: Column(
//               children: <Widget>[
//                 logoWidget("assets/images/logo1.png"),
//                 reusableTextField(
//                   "Enter UserName",
//                   Icons.person_outline,
//                   false,
//                   _emailTextController,
//                 ),
//                 SizedBox(height: 20),
//                 reusableTextField(
//                   "Enter Password",
//                   Icons.lock_outline,
//                   true,
//                   _passwordTextController,
//                 ),
//                 SizedBox(height: 20),
//                 signInSignUpButton(context, true, () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => MyApp()), // Assuming MyApp is your main class
//                   );
//                 }),
//                 signUpOption(),
//                 emergencyButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Row signUpOption() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text("Don't have an account?",
//             style: TextStyle(color: Colors.white70)),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => SignUpScreen()));
//           },
//           child: const Text(
//             " Sign Up",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         )
//       ],
//     );
//   }
//
//   Widget signInSignUpButton(BuildContext context, bool isSignIn, VoidCallback onPressed) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         primary: Colors.white, // Customize button color
//         onPrimary: Colors.blue, // Customize text color
//         padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//       ),
//       child: Text(
//         isSignIn ? "Sign In" : "Sign Up",
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
//
//   Widget emergencyButton() {
//     return ElevatedButton(
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => MyApp1()),
//         );
//       },
//       style: ElevatedButton.styleFrom(
//         primary: Colors.red,
//         onPrimary: Colors.white,
//         padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//       ),
//       child: Text(
//         "Emergency",
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }
//
// Color hexStringToColor(String hexColor) {
//   int intValue = int.parse(hexColor, radix: 16);
//   return Color(intValue).withOpacity(1.0);
// }


// SignIn.dart

import 'package:flutter/material.dart';
import 'package:first/screens/signup.dart';
import '../main.dart';
import 'package:first/AllPages.dart';
import '../reusable_widget/reusable_widget.dart';
import '../user_end/user_end.dart'; // Import AllPages.dart

class SignIn extends StatefulWidget {
  const SignIn({Key? key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF5E35B1), // Deep Purple
              Color(0xFF3F51B5), // Indigo
              Color(0xFF2196F3), // Blue
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/logo1.png"),
                  reusableTextField(
                  "Enter UserName",
                  Icons.person_outline,
                  false,
                  _emailTextController,
                ),
                SizedBox(height: 20),
                reusableTextField(
                  "Enter Password",
                  Icons.lock_outline,
                  true,
                  _passwordTextController,
                ),
                SizedBox(height: 20),
                signInSignUpButton(context, true, () {
                  // Replace the navigation code with the appropriate page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                }),
                signUpOption(),
                emergencyButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget signInSignUpButton(BuildContext context, bool isSignIn, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.white, // Customize button color
        onPrimary: Colors.blue, // Customize text color
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      ),
      child: Text(
        isSignIn ? "Sign In" : "Sign Up",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget emergencyButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyApp1()),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        onPrimary: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      ),
      child: Text(
        "Emergency",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

