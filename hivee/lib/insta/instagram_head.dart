import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hivee/insta/test.dart';
import 'package:hivee/insta/widgets.dart';

class NewHive extends StatefulWidget {
  const NewHive({super.key});

  @override
  State<NewHive> createState() => _NewHiveState();
}

class _NewHiveState extends State<NewHive> {
  int counter = 0;
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Instagram',
          style: GoogleFonts.cantoraOne(color: Colors.white),
        ),

        leading: Icon(
          FontAwesomeIcons.instagram,
          size: 30,
          color: Colors.purple,
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Profile(text: "person 1"),
                    Gap(20),
                    Profile(text: 'Person 2'),
                    Gap(20),
                    Profile(text: 'Person 3'),
                    Gap(20),
                    Profile(text: 'Person 4'),
                    Gap(20),
                    Profile(text: 'Person 5'),
                    Gap(20),
                    Profile(text: 'Person 6'),
                    Gap(20),
                    Profile(text: 'Person 7'),
                  ],
                ),
              ),
              Gap(30),
              Post(),
            ],
          ),
        ),
      ),
    );
  }
}
