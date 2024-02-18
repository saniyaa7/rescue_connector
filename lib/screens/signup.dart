import 'package:flutter/material.dart';
import 'package:first/reusable_widget/reusable_widget.dart';
import 'package:first/screens/signup2.dart';
import 'package:first/screens/signin.dart';
import 'package:first/utils/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _areaOfExpertiseController = TextEditingController();
  TextEditingController _numberOfMembersController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
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
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter UserName",
                  Icons.person_outline,
                  false,
                  _userNameTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter Email Id",
                  Icons.email,
                  false,
                  _emailTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter Password",
                  Icons.lock_outlined,
                  true,
                  _passwordTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Area of Expertise",
                  Icons.business,
                  false,
                  _areaOfExpertiseController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Number of Members",
                  Icons.people,
                  false,
                  _numberOfMembersController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Location",
                  Icons.location_on,
                  false,
                  _locationController,
                ),
                const SizedBox(height: 20),
                signInSignUpButton(context, false, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen1()),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Color hexStringToColor(String hexColor) {
  int intValue = int.parse(hexColor, radix: 16);
  return Color(intValue).withOpacity(1.0);
}
