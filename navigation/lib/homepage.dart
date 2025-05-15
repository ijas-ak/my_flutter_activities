import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:navigation/main.dart';

import 'package:navigation/pages/profilepage.dart';
import 'package:navigation/pages/settingspage.dart';
import 'package:navigation/pages/signuppage.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final List _screens = [SignUpPage(), PageTwo(), SettingPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepPurple,
        animationDuration: Duration(milliseconds: 200),
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },

        items: [Icon(Icons.home), Icon(Icons.person), Icon(Icons.settings)],
      ),
      body: _screens[selectedindex],
    );
  }
}
