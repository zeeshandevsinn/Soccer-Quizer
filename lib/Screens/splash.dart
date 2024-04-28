import 'dart:async';

import 'package:flutter/material.dart';

import 'package:soccer_quizzer/navbar.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NavBarPage()));
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size * 1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg-stats.jpg"), fit: BoxFit.fill)),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Text("Welcom" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                // Padding(padding: EdgeInsets.only(bottom: 30.0),child:new Image.asset('assets/images/logos.jpeg',height: 100.0, width: 100, fit: BoxFit.scaleDown,))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  'images/football icon.png',
                  width: animation.value * 200,
                  height: animation.value * 200,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
