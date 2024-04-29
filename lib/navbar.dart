import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:soccer_quizzer/Screens/home.dart';
import 'package:soccer_quizzer/Screens/quiz.dart';
import 'package:soccer_quizzer/Screens/setting.dart';
import 'package:soccer_quizzer/Screens/sports_football_screen.dart';
import 'package:soccer_quizzer/utils/my_colors.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({Key? key}) : super(key: key);

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  int current_index = 0;

  final List<Widget> pages = [
    HomePage(),
    QuizScreen(),
    SportsFootballScreen(),
    Settings()
  ];

  void OnTapped(int index) {
    setState(() {
      current_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[current_index],
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: MyColors.container_grey,
          onTap: OnTapped,
          items: <Widget>[
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.quiz,
              color: Colors.white,
            ),
            Icon(
              Icons.sports_football,
              color: Colors.white,
            ),
            Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ]),
    );
  }
}
