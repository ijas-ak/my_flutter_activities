import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// @HiveType(typeId: 1)
// class StudentModel {
//   @HiveField(0)
//   String name;
//   @HiveField(1)
//   int age;

//   StudentModel({required this.name, required this.age});
// }

class Hivee extends StatefulWidget {
  const Hivee({super.key});

  @override
  State<Hivee> createState() => _HiveeState();
}

class _HiveeState extends State<Hivee> {
  String data = 'ijas';
  void saveData() {
    final mydata = Hive.box('newkey');
    mydata.put('newkey', data);
    print(mydata.get('newkey'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                saveData();
              },
              child: Text("print"),
            ),
            Text(data),
          ],
        ),
      ),
    );
  }
}
