import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.white),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, color: Colors.white),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_rounded, color: Colors.white),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.video, color: Colors.white),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.white),
          label: '',
        ),
      ],
    );
  }
}

class Profile extends StatelessWidget {
  final String text;
  const Profile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 3),
          ),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'https://t4.ftcdn.net/jpg/02/23/50/73/360_F_223507349_F5RFU3kL6eMt5LijOaMbWLeHUTv165CB.jpg',
            ),
          ),
        ),
        Text(text, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
// Card(
              //   child: ListTile(
              //     title: Text('Likes : $counter'),
              //     trailing: IconButton(
              //       onPressed: () {
              //         setState(() {
              //           if (!liked) {
              //             counter++;
              //           } else {
              //             counter--;
              //           }

              //           liked = !liked;
              //         });
              //       },
              //       icon: Icon(
              //         Icons.favorite,
              //         color: liked ? Colors.red : Colors.grey,
              //       ),
              //     ),
              //   ),
              // ),