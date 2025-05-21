import 'dart:core';

import 'package:flutter/material.dart';
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
        title: Text("TO Do List"),
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
                    },
                    child: Text("Save"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
