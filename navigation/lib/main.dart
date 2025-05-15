import 'package:flutter/material.dart';
import 'package:navigation/homepage.dart';
import 'package:navigation/pages/logginedpage.dart';
import 'package:navigation/pages/profilepage.dart';
import 'package:navigation/pages/signuppage.dart';
import 'package:navigation/splashscreen.dart';

int selectedindex = 0;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Demo',
      home: PageOne(),
      routes: {
        'pageone': (context) => PageOne(),
        'pagetwo': (context) => PageTwo(),
        'loginedpage': (context) => LoginEntry(),
        'signuppage': (context) => SignUpPage(),
      },
    );
  }
}
