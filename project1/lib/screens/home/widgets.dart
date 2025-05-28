import 'package:flutter/material.dart';
import 'package:project1/screens/database/studentmodel.dart';

class ListOfStudents extends StatelessWidget {
  final Student student;
  const ListOfStudents({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      color: Colors.deepPurple,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            student.name[0].toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        title: Text(
          'Name : ${student.name}',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        subtitle: Text(
          "Age : ${student.age}",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

class Name extends StatelessWidget {
  const Name({super.key, required this.username});

  final TextEditingController username;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      validator: (value) {
        if (value!.isEmpty) {
          return "Username Required";
        } else {
          return null;
        }
      },
      autofocus: true,
      controller: username,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.grey),
        labelText: "NAME",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}

class Age extends StatelessWidget {
  const Age({super.key, required this.age});

  final TextEditingController age;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      validator: (value) {
        if (value!.isEmpty) {
          return "Age is Required";
        } else {
          return null;
        }
      },
      controller: age,
      decoration: InputDecoration(
        labelText: "AGE",
        labelStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}
