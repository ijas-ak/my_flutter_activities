import 'dart:core';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:practicepage/widgets.dart';

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  final _controller = TextEditingController();
  List toDolist = [];
  void addToList() {
    setState(() {
      toDolist.add(_controller.text);
      _controller.clear();
    });
    saveData();
  }

  void delete(String name) {
    setState(() {
      toDolist.remove(name);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,

        duration: Duration(seconds: 1),
        content: Text("Data Deleted Succesfully..."),
      ),
    );
    saveData();
  }

  final mybox = Hive.box("mydata");

  void saveData() {
    mybox.put("mydata", toDolist);
  }

  void getData() {
    final data = mybox.get("mydata", defaultValue: []);
    setState(() {
      toDolist = List<String>.from(data);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        leading: Icon(
          FontAwesomeIcons.pencil,
          size: 30,
          color: Colors.deepPurple,
        ),
        title: Text("TO DO List"),
        centerTitle: true,
        backgroundColor: Colors.yellow.shade300,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: toDolist.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      TodoList(name: toDolist[index], onDelete: delete),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 30,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.yellow[400],
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: TextField(
                  autofocus: true,
                  controller: _controller,
                  decoration: InputDecoration(hintText: "Add Task"),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      addToList();
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 1),
                          content: Text("Data Added Successfully.."),
                        ),
                      );
                    },
                    child: Text("Save"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.edit, size: 30),
      ),
    );
  }
}
