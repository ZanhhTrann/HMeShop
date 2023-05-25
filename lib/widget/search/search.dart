import 'package:flutter/material.dart';
import 'package:hmeshop/widget/search/searchCat.dart';

import '../../API/API_DATA/category/category.dart';

Widget Search({List<category>? cat}) {
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
        onFieldSubmitted: (value) {
          SearchCat(cat: cat, search: value);
          print(value);
        }),
  );
}
