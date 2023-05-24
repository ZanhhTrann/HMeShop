import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmeshop/view/product/show_list_Products.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../API/API_DATA/category/category.dart';

Widget ListSubCat(
    {String? par, List<category>? cat, double? size, List<String>? tagcode}) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    physics: const BouncingScrollPhysics(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        par!.text.black.size(size!).make().onTap(() {
          if (tagcode!.isNotEmpty)
            Get.to(() => ShowListProducts(tagcode: tagcode[0], cat: cat));
        }),
        cat!.isNotEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    cat.length,
                    (index) => ListSubCat(
                            par: cat[index].getCatName(),
                            cat: cat[index].getCatArray(),
                            size: size - 4,
                            tagcode: cat[index].getTagCodes())
                        .box
                        .margin(const EdgeInsets.only(left: 8))
                        .make()),
              )
            : 0.heightBox
      ],
    ),
  );
}
