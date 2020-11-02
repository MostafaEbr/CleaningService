import 'package:flutter/material.dart';
import 'package:matrixtask/screens/confirmScreen.dart';
import 'package:matrixtask/screens/loginScreen.dart';
import 'package:matrixtask/screens/phoneScreen.dart';
import 'package:matrixtask/screens/service1Screen.dart';
import 'package:matrixtask/screens/service2Screen.dart';
import 'package:matrixtask/screens/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: PhoneScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        PhoneScreen.id: (context) => PhoneScreen(),
        ConfirmScreen.id: (context) => ConfirmScreen(),
        Service1Screen.id: (context) => Service1Screen(),
        Service2Screen.id: (context) => Service2Screen(),
      },
    );
  }
}
