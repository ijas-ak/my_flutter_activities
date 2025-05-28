import 'package:expenseapp/models/model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List
  List<ExpenseData> datas = [];
  //Controllers
  final itemController = TextEditingController();
  final expenseController = TextEditingController();
  //Functions
  void saveExpense() {
    var parsedPrice = double.parse(expenseController.text);
    var savedData = ExpenseData(
      itemName: itemController.text,
      price: parsedPrice,
    );
    if (itemController.text.trim().isEmpty) {
      return;
    }

    setState(() {
      datas.add(savedData);
    });
    itemController.clear();
    expenseController.clear();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    itemController.dispose();
    expenseController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      //floating action button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: SizedBox(
                  height: 200,
                  width: 100,
                  child: Column(
                    children: [
                      TextField(
                        controller: itemController,
                        decoration: InputDecoration(labelText: "Item"),
                      ),
                      TextField(
                        controller: expenseController,
                        decoration: InputDecoration(labelText: "Price"),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              saveExpense();
                            },
                            child: Text("Save"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add_box, color: Colors.white),
      ),

      //Body
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: datas.length,
              itemBuilder: (context, index) {
                final data = datas;
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Colors.deepPurple,
                    margin: EdgeInsets.all(15),
                    child: ListTile(
                      trailing: Text(
                        "${data[index].price} rs",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      title: Text(
                        data[index].itemName,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
