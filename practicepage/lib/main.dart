import 'package:flutter/material.dart';
import 'package:practicepage/database/formmodel.dart';
import 'package:practicepage/login_form/learnmethods.dart';
import 'package:practicepage/notifier.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MyFormAdapter());
  await Hive.openBox<MyForm>('myform');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practice App',
      home: LearnMethods(),
    );
  }
}
