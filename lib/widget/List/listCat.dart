// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hmeshop/API/API_DATA/category/category.dart';
import 'package:hmeshop/view/product/show_title_products.dart';
import 'package:velocity_x/velocity_x.dart';

Widget ListCat({List<category>? list}) {
  return Container(
    alignment: Alignment.center,
    child: Row(
        children: List.generate(
            list!.length,
            (index) => list[index]
                    .getCatName()
                    .text
                    .black
                    .make()
                    .box
                    .white
                    .padding(const EdgeInsets.all(8))
                    .margin(const EdgeInsets.symmetric(horizontal: 4))
                    .shadowMd
                    .roundedSM
                    .make()
                    .onTap(() {
                  Get.to(() => ShowTitleProduct(
                      list: list[index].getCatArray(),
                      name: list[index].getCatName()));
                }))),
  );
}
