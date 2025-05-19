import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        width: 500,
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              color: Colors.black,
              child: ListTile(
                leading: CircleAvatar(),
                title: Text('Ijas', style: TextStyle(color: Colors.black)),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
