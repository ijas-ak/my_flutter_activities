import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MaterialApp(home: GptCode()));
// }

class GptCode extends StatefulWidget {
  const GptCode({super.key});

  @override
  State<GptCode> createState() => _GptCodeState();
}

class _GptCodeState extends State<GptCode> {
  String storedData = '';
  final TextEditingController typedData = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData(); // Load saved data on startup
  }

  Future<void> saveData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('myKey', typedData.text);
    print('Saved: ${typedData.text}');
  }

  Future<void> getData() async {
    final pref = await SharedPreferences.getInstance();
    String? saved = pref.getString('myKey');
    print('Fetched: $saved');
    setState(() {
      storedData = saved ?? '';
      typedData.text = storedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SHARED PREFERENCES")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: typedData,
              decoration: InputDecoration(
                labelText: 'Type something...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await saveData();
              },
              child: Text('SAVE DATA'),
            ),
            ElevatedButton(onPressed: getData, child: Text('GET DATA')),
            SizedBox(height: 20),
            Text(
              storedData.toUpperCase(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
