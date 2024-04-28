import 'package:flutter/material.dart';
import 'package:soccer_quizzer/Screens/splash.dart';
import 'package:soccer_quizzer/navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
