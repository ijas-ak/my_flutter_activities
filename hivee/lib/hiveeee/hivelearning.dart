import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hivee/main.dart';

class LearnHive extends StatefulWidget {
  const LearnHive({super.key});

  @override
  State<LearnHive> createState() => _LearnHiveState();
}

class _LearnHiveState extends State<LearnHive> {
  @override
  void initState() {
    getData();
    data.clear();
    super.initState();
  }

  final user = TextEditingController();
  List<String> data = [];
  final _mybox = Hive.box('newkey');
  // dataCheck(String value) {
  //   if (value.isEmpty) {
  //     return ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text('No data Found')));
  //   } else {
  //     return;
  //   }
  // }

  saveData() {
    List<String> currentList =
        _mybox.get('newkey', defaultValue: [])?.cast<String>() ?? [];
    String newValue = user.text.trim();

    if (newValue.length < 3) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(' Sorry! Username is too short')));
      return;
    }

    currentList.add(newValue);
    _mybox.put('newkey', currentList);
    user.clear(); // Clear input after saving
    getData(); // Refresh UI
  }

  dltData() {
    List data = _mybox.get('newkey', defaultValue: []);
    setState(() {
      data.clear();
    });
  }

  getData() {
    List<String> fetchedList =
        _mybox.get('newkey', defaultValue: [])?.cast<String>() ?? [];
    setState(() {
      data = fetchedList;
    });
  }

  void deleteItemByIndex(int index) {
    List<String> currentList =
        _mybox.get('newkey', defaultValue: [])?.cast<String>() ?? [];

    if (index >= 0 && index < currentList.length) {
      currentList.removeAt(index); // Remove item at given index
      _mybox.put('newkey', currentList); // Save updated list
      getData(); // Refresh UI
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'TO-DO LIST',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              cursorColor: Colors.red,
              style: TextStyle(color: Colors.white),
              controller: user,
              decoration: InputDecoration(
                hintText: 'Type Something...',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    user.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
            Gap(30),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
              ),
              onPressed: () {
                saveData();
                getData();
              },
              child: Text('ADD', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Gap(30),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Gap(20),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.amber,
                    elevation: 10,
                    child: ListTile(
                      title: Text(data[index]),
                      trailing: IconButton(
                        onPressed: () {
                          deleteItemByIndex(index);
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    ),
                  );
                },
              ),
            ),
            TextButton(
              onPressed: () {
                dltData();
              },
              child: Text(
                'CLEAR ALL',
                style: TextStyle(
                  letterSpacing: 1,
                  wordSpacing: 10,
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
