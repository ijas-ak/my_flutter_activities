import 'package:flutter/material.dart';

class LoginEntry extends StatelessWidget {
  const LoginEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'pageone');
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          'Welcome',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}
