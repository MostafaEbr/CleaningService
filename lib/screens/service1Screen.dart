import 'package:flutter/material.dart';

class Service1Screen extends StatefulWidget {
  static String id  = "Service1Screen" ;

  @override
  _Service1ScreenState createState() => _Service1ScreenState();
}


class _Service1ScreenState extends State<Service1Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BottomAppBar(
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
