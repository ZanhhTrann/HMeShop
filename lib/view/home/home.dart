// ignore_for_file: prefer_const_constructors, unused_import, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hmeshop/widget/List/listCat.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../API/API_DATA/category/category.dart';
import '../../const/list.dart';
import '../../widget/List/listNewProducts.dart';
import '../../widget/Vxswiper/VS_Product.dart';
import '../../widget/Vxswiper/VS_images.dart';
import '../../widget/appbar/build_Appbar.dart';
import '../../widget/search/search.dart';

class Home extends StatefulWidget {
  final List<category>? cat;
  const Home({Key? key, required this.cat}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  Search(),
                  ListCat(list: widget.cat),
                ],
              ),
            ),
            VSImages(list: bannerList2, height: 100),
            10.heightBox,
            ListNProduct(list: widget.cat, context: context, index: 0),
            // 15.heightBox,
            // ListNProduct(list: widget.cat, context: context, index: 2),
            10.heightBox,
            'H&M conver NY'.text.fontFamily('bold').size(16).make(),
            5.heightBox,
            VSImages(
              list: bannerList,
              height: 300,
            ),
            // 100.heightBox
          ],
        ),
      ),
    );
  }
}
