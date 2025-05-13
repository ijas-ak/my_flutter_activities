import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  String storeddata = '';
  savedata() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('myKey', typedData.text);
    print('Data saved : ${typedData.text}');
  }

  getdata() async {
    final pref = await SharedPreferences.getInstance();
    String? saved = pref.getString('myKey');
    setState(() {
      storeddata = saved ?? '';
      typedData.text = storeddata;
    });
    print('Data Fetched');
  }

  final typedData = TextEditingController();
  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SHARED PREFERENCES"), centerTitle: true),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: typedData,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Type Something...!",
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                await savedata();
                getdata();
              },
              child: Text("SAVE DATA"),
            ),
            ElevatedButton(
              onPressed: () {
                getdata();
              },
              child: Text("GET DATA"),
            ),
            SizedBox(height: 30),
            Text(storeddata.toUpperCase()),
          ],
        ),
      ),
    );
  }
}
