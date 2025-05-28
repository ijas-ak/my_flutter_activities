import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project1/screens/database/studentmodel.dart';
import 'package:project1/screens/home/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StudentAdapter());
  await Hive.openBox<Student>("mydata");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Myapp",
      home: HomePage(),
    );
  }
}
