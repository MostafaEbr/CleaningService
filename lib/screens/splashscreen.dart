import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrixtask/screens/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  static String id = "SplashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState()  {
    super.initState();

      Timer(Duration(seconds:5),
              ()=> Navigator.pushNamed(context, LoginScreen.id)
      );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 330.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/back.png'),
                  fit: BoxFit.fill),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment(0.0, -1.0),
              end: Alignment(0.0, 1.0),
              colors: [
                const Color(0xa6e2e1e1),
                const Color(0xfcdfd3d3),
                const Color(0xffdbd7d7),
                const Color(0xff809713),
                const Color(0xcf9eb90d)
              ],
              stops: [0.0, 0.559, 1.0, 1.0, 1.0],
            )),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/logo.png'),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
