// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, unused_local_variable, prefer_interpolation_to_compose_strings, unused_import

import 'package:flutter/material.dart';
import 'package:hmeshop/API/API_DATA/list_products/product.dart';
import 'package:hmeshop/widget/List/listCat.dart';
import 'package:hmeshop/widget/Vxswiper/VS_Product.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../API/API_DATA/category/category.dart';

Widget ListNProduct({List<category>? list, int? index, int? length, context}) {
  // String name = '';
  // list![2].getCatArray()[0].getCatArray()[0].printTag(length: 2);
  // print(list!.length);
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      10.heightBox,

      ('New Arrivals of ' + list![index!].getCatName())
          .text
          .fontFamily('bold')
          .size(16)
          .make()
          .box
          .margin(EdgeInsets.only(left: 50))
          .make(),
      10.heightBox,
      VSProduct(
        name: list[index].getCatArray()[0].getCatArray()[0].getTagCodes()[0],
        height: 300,
        pagesize: '3',
      ),
      // list[index].tagCodes[0].text.make()
      'See more ...'
          .text
          .fontFamily('semibold')
          .size(4)
          .make()
          .box
          .margin(EdgeInsets.only(left: 20))
          .make(),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(children: [ListCat(list: list[index].getCatArray())]),
      ),
    ],
  );
}
