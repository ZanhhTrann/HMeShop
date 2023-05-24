// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmeshop/API/API_DATA/list_products/product.dart';
import 'package:hmeshop/view/product/show_infor_product.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widget/colors/getColor.dart';

Widget SProduct({product? product, double? height}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Image.network(product!.getImgUrl(), height: height! - 50),
      5.widthBox,
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          product.getName().text.size(18).fontFamily('bold').make(),
          Divider(
            color: Color.fromARGB(255, 0, 0, 0),
            thickness: 1,
            height: 20,
          ),
          5.heightBox,
          (product.getDescription().substring(0, 50) + ".....")
              .text
              .fontFamily('semibold')
              .black
              .size(1)
              .make(),
          5.heightBox,
          ListColors(list: product.getRgbColor(), full: false),
          10.heightBox,
          ("\$ ${product.getWprice()}")
              .text
              .black
              .fontFamily('semiboid')
              .size(8)
              .make(),
          10.heightBox,
          if (product.getSale() == true)
            ("\$ ${product.getRedprice()}")
                .text
                .black
                .fontFamily('semiboid')
                .size(8)
                .make(),
        ],
      ))
    ],
  ).onTap(() {
    Get.to(() => showInforProduct(pro: product));
  });
}
