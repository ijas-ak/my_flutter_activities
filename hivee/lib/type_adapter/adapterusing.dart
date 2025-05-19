// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hivee/learnAdapter/model.dart';

// class HiveUsing extends StatefulWidget {
//   const HiveUsing({super.key});

//   @override
//   State<HiveUsing> createState() => _HiveUsingState();
// }

// class _HiveUsingState extends State<HiveUsing> {
//   final studentname = TextEditingController();
//   final studentage = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     final mybox = Hive.box<Student>('student');
//     mybox.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           final mybox = Hive.box<Student>('student');

//           final ageValue = studentage.text.trim();
//           final userAge = int.tryParse(ageValue);
//           if (userAge == null) {
//             ScaffoldMessenger.of(
//               context,
//             ).showSnackBar(SnackBar(content: Text("Invalid Age")));
//             return;
//           }
//           final student = Student(
//             name: studentname.text,
//             age: int.tryParse(studentage.text) ?? 0,
//           );
//           mybox.add(student);
//         },
//         child: Icon(Icons.add),
//       ),
//       body: Container(
//         margin: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: studentname,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: "Name",
//               ),
//             ),
//             Gap(30),
//             TextFormField(
//               controller: studentage,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: "Age",
//               ),
//             ),
//             Gap(30),
//             Expanded(
//               child: ValueListenableBuilder(
//                 valueListenable: Hive.box<Student>('student').listenable(),
//                 builder: (context, Box<Student> mybox, _) {
//                   final students = mybox.values.toList();
//                   final keys = mybox.keys.toList();
//                   return ListView.builder(
//                     itemCount: students.length,
//                     itemBuilder: (context, index) {
//                       final student = students[index];
//                       final key = keys[index];
//                       return Card(
//                         child: ListTile(
//                           title: Text(student.name),
//                           subtitle: Text(student.age.toString()),
//                           trailing: IconButton(
//                             onPressed: () {
//                               mybox.delete(key);
//                             },
//                             icon: Icon(Icons.delete, color: Colors.red),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
