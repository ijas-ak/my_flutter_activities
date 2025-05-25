import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todolistapp/model.dart';
import 'package:todolistapp/pages/homepage.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoListAppAdapter());
  await Hive.openBox<TodoListApp>('todo');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
