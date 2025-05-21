import 'package:flutter/material.dart';
import 'package:slidable_button/slidable_button.dart';

class TodoList extends StatefulWidget {
  final String name;
  final void Function(String) onDelete;

  const TodoList({super.key, required this.name, required this.onDelete});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  var toDolist = [];
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Card(
        color: Colors.yellow[300],
        child: ListTile(
          title: Text(
            widget.name.toUpperCase(),
            style: TextStyle(
              decoration:
                  selected ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              widget.onDelete(widget.name);
            },
            icon: Icon(Icons.delete, color: Colors.red),
          ),

          leading: Checkbox(
            value: selected,
            onChanged: (value) {
              setState(() {
                selected = !selected;
              });
            },
          ),
        ),
      ),
    );
  }
}
