//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
//import 'package:navigation/main.dart';

final formKey = GlobalKey<FormState>();

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    void naviButton() async {
      if (formKey.currentState!.validate()) {
        showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          },
        );
        await Future.delayed(Duration(seconds: 3));
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, 'loginedpage');
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(),
              backgroundColor: Colors.red,
              title: Text('Error!', style: TextStyle(color: Colors.white)),
              content: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Ok', style: TextStyle(color: Colors.black)),
              ),
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          'SIGN UP',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            DrawerHeader(child: Icon(Icons.home, size: 35)),
            ListTile(
              title: Text('H O M E'),
              onTap: () => Navigator.pushNamed(context, 'pageone'),
            ),
            ListTile(title: Text('P R O F I L E')),
            ListTile(title: Text('S E T T I N G S')),
          ],
        ),
      ),
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == 'ijasak@gmail.com') {
                      return null;
                    } else {
                      return ' ';
                    }
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Gap(30),
                TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value == 'ijasak123') {
                      return null;
                    } else {
                      return '';
                    }
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Gap(30),
                ElevatedButton(
                  onPressed: () {
                    naviButton();
                  },
                  child: Text('Sign in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
