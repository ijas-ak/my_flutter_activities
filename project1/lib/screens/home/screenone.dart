import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:project1/screens/database/studentmodel.dart';
// import 'package:project1/screens/home/screentwo.dart';
import 'package:project1/screens/home/widgets.dart';

class HoemPage extends StatefulWidget {
  const HoemPage({super.key});

  @override
  State<HoemPage> createState() => _HoemPageState();
}

class _HoemPageState extends State<HoemPage> {
  final _myKey = GlobalKey<FormState>();
  //Variables--
  var mybox = Hive.box<Student>('mydata');
  List<Student> data = [];
  final username = TextEditingController();
  final age = TextEditingController();

  //DataSaving
  void saveData() {
    var parsedage = int.parse(age.text);
    var student = Student(name: username.text, age: parsedage);
    mybox.put(DateTime.now().toString(), student);
    loadData();
  }

  //DataGeting
  void loadData() {
    setState(() {
      data = mybox.values.toList();
      username.clear();
      age.clear();
    });
  }

  //DataDeleting
  void delete() {
    mybox.clear();
    loadData();
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(15),
        actions: [Icon(Icons.share)],
        iconTheme: IconThemeData(color: Colors.white),
        leading: Icon(Icons.menu),
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Student ',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: 'Form!',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.yellow[400],
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.deepPurple[800],
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        child: Form(
          key: _myKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Name(username: username),
              Gap(30),
              Age(age: age),
              Gap(30),
              ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  backgroundColor: WidgetStatePropertyAll(Colors.red),
                ),
                onPressed: () {
                  if (_myKey.currentState!.validate()) {
                    saveData();
                    loadData();
                  }
                },
                child: Text("P R I N T"),
              ),
              Gap(40),
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final student = data[index];
                    return ListOfStudents(student: student);
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  delete();
                },
                icon: Icon(
                  // ignore: deprecated_member_use
                  FontAwesomeIcons.remove,
                  size: 30,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
