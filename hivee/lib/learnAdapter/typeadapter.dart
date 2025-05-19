import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hivee/learnAdapter/person.dart';

class LearnAdapter extends StatefulWidget {
  const LearnAdapter({super.key});

  @override
  State<LearnAdapter> createState() => _LearnAdapterState();
}

class _LearnAdapterState extends State<LearnAdapter> {
  final username = TextEditingController();
  final age = TextEditingController();
  String? data;
  //My Hive Key
  final personBox = Hive.box<Person>('mydata');
  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() {
    final obj = personBox.get('mydata'); // Load from Hive using the correct key
    if (obj != null) {
      setState(() {
        data = 'name: ${obj.name}, age: ${obj.age}';
      });
    } else {
      setState(() {
        data = null;
      });
    }
  }

  void saveData() {
    final parsedAge = int.tryParse(age.text) ?? 0;
    final obj = Person(name: username.text, age: parsedAge);
    personBox.put('mydata', obj);
    getData();
  }

  void deleteData() {
    setState(() {
      personBox.delete("mydata");
      data = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  deleteData();
                },
                child: Text("Clear"),
              ),
              Text(
                data ?? "No data Found",
                style: GoogleFonts.sixCaps(fontSize: 60, letterSpacing: 4),
              ),
              Gap(40),
              TextFormField(
                controller: username,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        username.clear();
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                ),
              ),
              Gap(30),
              TextFormField(
                controller: age,
                decoration: InputDecoration(
                  labelText: "age",
                  border: OutlineInputBorder(),
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        username.clear();
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                ),
              ),
              Gap(40),
              ElevatedButton(
                onPressed: () {
                  saveData();
                },
                child: Text("GetData"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
