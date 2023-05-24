// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../API/API_DATA/category/category.dart';
import '../List/list_sub_cat.dart';

Widget GridVP({List<category>? cat}) {
  return Container(
    padding: EdgeInsets.all(12),
    child: GridView.builder(
        shrinkWrap: true,
        itemCount: cat!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 4),
        itemBuilder: (context, index) {
          return ListSubCat(
              par: cat[index].getCatName(),
              cat: cat[index].getCatArray(),
              size: 16,
              tagcode: cat[index].getTagCodes());
          // return 'hhh'.text.black.make();
        }),
  );
}
