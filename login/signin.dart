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

// import '../main.dart';

// class SignIn extends StatefulWidget {
//   const SignIn({Key? key});

//   @override
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   TextEditingController _passwordTextController = TextEditingController();
//   TextEditingController _emailTextController = TextEditingController();

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

// Color hexStringToColor(String hexColor) {
//   int intValue = int.parse(hexColor, radix: 16);
//   return Color(intValue).withOpacity(1.0);
// }


// SignIn.dart

// 
import 'package:first/AllPages.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:first/screens/home.dart';
import 'package:first/screens/signup.dart';
import 'package:first/user_end/user_end.dart';
import 'package:first/utils/colors.dart';
import 'package:first/reusable_widget/reusable_widget.dart';
import 'package:first/AllPages.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  Future<void> _signIn() async {
    final String email = _emailTextController.text;
    final String password = _passwordTextController.text;

    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/api/auth/signin'), // Updated endpoint to /login
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        // Login successful, parse response body
        Map<String, dynamic> data = jsonDecode(response.body);

        // Navigate to next screen (replace MyHomePage with your desired screen)
        Navigator.pushReplacement(
          context,
          // MaterialPageRoute(builder: (context) =>MyApp(data['user'])),
          MaterialPageRoute(builder: (context) =>MyApp()),
        );
      } else {
        // Login failed, show error message
        print('Login failed: ${response.body}');
        // Show a snackbar or dialog to display error
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid email or password. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print('Error during login: $e');
      // Handle other errors
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

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
              20,
              MediaQuery.of(context).size.height * 0.1,
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/logo1.png"),
                SizedBox(height: 40), // Increase spacing
                TextField(
                  controller: _emailTextController,
                  decoration: InputDecoration(
                    labelText: 'Enter Email',
                    prefixIcon: Icon(Icons.person_outline),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordTextController,
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _signIn,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  ),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
        const Text("Don't have an account?", style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget emergencyButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp1()));
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

Color hexStringToColor(String hexColor) {
  int intValue = int.parse(hexColor, radix: 16);
  return Color(intValue).withOpacity(1.0);
}

class MyHomePage extends StatelessWidget {
  final dynamic userData;

  MyHomePage(this.userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${userData['username']}!'),
            // Display other user information as needed
          ],
        ),
      ),
    );
  }
}
