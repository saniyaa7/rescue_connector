import 'package:flutter/material.dart';
import 'package:first/screens/signin.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Flutter App',
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
