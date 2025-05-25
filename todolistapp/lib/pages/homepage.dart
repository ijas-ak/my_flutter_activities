import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todolistapp/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Hive DataBase
  final mybox = Hive.box<TodoListApp>('todo');
  //Variables
  final mycontroller = TextEditingController();

  //Data
  List<TodoListApp> todo = [];

  //SaveData
  void saveData() {
    final todoData = TodoListApp(title: mycontroller.text, isDone: false);
    mybox.add(todoData);
  }

  //Methods
  void addList() {
    if (mycontroller.text.trim().isEmpty) return;
    final tododata = TodoListApp(title: mycontroller.text, isDone: false);
    mybox.add(tododata);
    mycontroller.clear();
    setState(() {
      todo = mybox.values.toList();
    });
    Navigator.pop(context);
  }

  void delete(int index) {
    todo[index].delete();
    setState(() {
      todo.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    todo = mybox.values.toList();
  }

  @override
  void dispose() {
    mycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      backgroundColor: Colors.blue[700],
      appBar: AppBar(
        title: Text("TODO LIST", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      //Body
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child:
                  todo.isEmpty
                      ? Center(
                        child: Text(
                          "NO TASKS SCHEDULED YET",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                      : ListView.builder(
                        itemCount: todo.length,
                        itemBuilder: (context, index) {
                          final mytodo = todo;
                          return Card(
                            color: Colors.deepPurple[600],
                            margin: EdgeInsets.all(15),
                            child: ListTile(
                              title: Text(
                                mytodo[index].title.toUpperCase(),
                                style: TextStyle(color: Colors.white),
                              ),
                              leading: Checkbox(
                                fillColor: WidgetStatePropertyAll(Colors.white),
                                activeColor: Colors.black,
                                checkColor: Colors.black,
                                value: mytodo[index].isDone,
                                onChanged: (value) {
                                  setState(() {
                                    mytodo[index].isDone =
                                        !mytodo[index].isDone;
                                    mytodo[index].save();
                                  });
                                },
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  delete(index);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red[600],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),

      //FloatingActionButton
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple[700],
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.deepPurple[200],
                title: TextField(
                  controller: mycontroller,
                  decoration: InputDecoration(
                    labelText: "To - Do...",
                    border: OutlineInputBorder(),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      addList();
                    },
                    child: Text("save"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
