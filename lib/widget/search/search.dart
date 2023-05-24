import 'package:flutter/material.dart';

Widget Search() {
  return Container(
    margin: const EdgeInsets.only(left: 8),
    width: 200,
    alignment: Alignment.topLeft,
    child: TextFormField(
      decoration: const InputDecoration(
          suffixIcon: Icon(Icons.search),
          border: InputBorder.none,
          hintText: 'Search....',
          filled: true,
          fillColor: Color.fromARGB(255, 255, 255, 255)),
    ),
  );
}
