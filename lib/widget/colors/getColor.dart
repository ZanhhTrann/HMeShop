// ignore_for_file: non_constant_identifier_names, unnecessary_string_interpolations, unused_import, prefer_interpolation_to_compose_strings, prefer_const_constructors, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
// import '../product.dart';

Widget ListColors({List<String>? list, bool? full}) {
  if (full == true) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
            children: List.generate(
          list!.length,
          (index) => VxBox()
              .size(8, 8)
              .roundedFull
              .color(Color(int.parse(list[index])))
              .margin(const EdgeInsets.symmetric(horizontal: 2))
              .make(),
        )));
  } else {
    return Row(
        children: List.generate(
      list!.length >= 3 ? 3 : list.length,
      (index) => VxBox()
          .size(8, 8)
          .roundedFull
          .color(Color.fromRGBO(
              Color(int.parse(list[index])).red,
              Color(int.parse(list[index])).green,
              Color(int.parse(list[index])).blue,
              1))
          .margin(const EdgeInsets.symmetric(horizontal: 2))
          .make(),
    ));
  }
}
