import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GitHive extends StatefulWidget {
  const GitHive({super.key});

  @override
  State<GitHive> createState() => _GitHiveState();
}

class _GitHiveState extends State<GitHive> {
  final username = TextEditingController();
  List data = [];
  final mybox = Hive.box('mydata');

  void getdata() {
    String todo = username.text;
    setState(() {
      data.add(todo);
      username.clear();
      saveData();
    });
  }

  ///Deleting Data
  void dltData(int index) {
    setState(() {   
      data.removeAt(index);
    });
    saveData();
  }

  void saveData() {
    mybox.put('mydata', data);
  }

  @override
  void initState() {
    data = mybox.get('mydata') ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO List'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final datas = data[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Colors.amber,
                      margin: EdgeInsets.all(15),
                      child: ListTile(
                        title: Text(
                          datas,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(Icons.info),
                        trailing: IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(' ${data[index]} Deleted '),
                              ),
                            );
                            dltData(index);
                          },
                          icon: Icon(Icons.delete),
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

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                        getdata();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Data Added Successfully..!")),
                        );
                      });
                    },
                    child: Text("OK"),
                  ),
                ],
                content: TextFormField(controller: username, autofocus: true),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
