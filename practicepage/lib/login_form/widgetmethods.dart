import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget textfield(
  String hint,
  TextEditingController mycontroller,
  String? Function(String?) validator,
) {
  return TextFormField(
    autofocus: true,
    cursorColor: Colors.black,
    validator: validator,
    controller: mycontroller,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.edit_note_rounded),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      hintText: hint,
    ),
  );
}

Widget gap() {
  return Gap(30);
}
