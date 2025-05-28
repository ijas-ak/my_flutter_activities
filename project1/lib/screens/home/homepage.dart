import 'package:flutter/material.dart';
import 'package:project1/screens/home/screenone.dart';
import 'package:project1/screens/home/screentwo.dart';
// import 'package:project1/screens/home/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,

        body: Column(
          children: [
            TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.home, color: Colors.white)),
                Tab(icon: Icon(Icons.person, color: Colors.white)),
              ],
            ),
            Expanded(child: TabBarView(children: [HoemPage(), ScreenTwo()])),
          ],
        ),
      ),
    );
  }
}
