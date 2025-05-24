import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:practicepage/database/formmodel.dart';
import 'package:practicepage/login_form/widgetmethods.dart';

class LearnMethods extends StatefulWidget {
  const LearnMethods({super.key});

  @override
  State<LearnMethods> createState() => _LearnMethodsState();
}

class _LearnMethodsState extends State<LearnMethods> {
  final _mybox = Hive.box<MyForm>('myform');

  List<MyForm> items = [];
  List<dynamic> keys = []; // Store Hive keys

  final myKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phonenumberController = TextEditingController();

  // Save data
  void saveData() {
    var form = MyForm(
      username: nameController.text,
      userage: int.parse(ageController.text),
      phoneNumber: int.parse(phonenumberController.text),
    );
    _mybox.add(form);
    getData(); // Refresh UI
  }

  // Load data and keys
  void getData() {
    setState(() {
      items = _mybox.values.toList();
      keys = _mybox.keys.toList();
    });
  }

  // Delete using index
  void deleteItem(int index) {
    _mybox.delete(keys[index]); // Use corresponding key
    getData(); //
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 300),
        backgroundColor: Colors.red,
        content: Text("Data Deleted..!!"),
      ),
    );
    // Refresh UI
  }

  void submitForm() {
    if (myKey.currentState!.validate()) {
      saveData();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 300),
          backgroundColor: Colors.green,
          content: Text("Data Added..!!"),
        ),
      );
      nameController.clear();
      ageController.clear();
      phonenumberController.clear();
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    phonenumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(10),
        backgroundColor: Colors.white,
        leading: Icon(FontAwesomeIcons.facebookF, color: Colors.blue, size: 30),
        actions: [
          Icon(Icons.search, size: 30, color: Colors.black),
          gap(),
          Icon(FontAwesomeIcons.facebookMessenger, color: Colors.black),
        ],
      ),

      backgroundColor: Colors.amber,
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(30),
        color: Colors.amber,
        child: Form(
          key: myKey,
          child: Column(
            children: [
              textfield("Enter Name", nameController, (value) {
                if (value!.isEmpty) return "Name is Required";
                return null;
              }),
              gap(),
              textfield("Enter Age", ageController, (value) {
                if (value!.isEmpty) return "Age is Required";
                return null;
              }),
              gap(),
              textfield("Enter PhoneNumber", phonenumberController, (value) {
                if (value!.isEmpty || value.length < 10) {
                  return "Phone number must be at least 10 digits";
                }
                return null;
              }),
              gap(),
              ElevatedButton(onPressed: submitForm, child: Text("SAVE")),
              Gap(30),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Card(
                      margin: EdgeInsets.all(10),
                      color: Colors.deepPurple,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(15),
                        title: Text(
                          "Name: ${item.username}",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "Age: ${item.userage}\nPhone: ${item.phoneNumber}",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.clear, color: Colors.white),
                          onPressed: () => deleteItem(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
