// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import, implementation_imports, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hmeshop/API/API_DATA/category/category.dart';
import 'package:hmeshop/widget/List/list_Image.dart';
import 'package:hmeshop/widget/Vxswiper/VS_url_Image.dart';
import 'package:hmeshop/widget/appbar/build_Appbar.dart';
import 'package:hmeshop/widget/infor_Product/infor_product.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../API/API_DATA/list_products/product.dart';

class showInforProduct extends StatefulWidget {
  final product? pro;
  const showInforProduct({super.key, required this.pro});

  @override
  State<showInforProduct> createState() => _showInforProductState();
}

class _showInforProductState extends State<showInforProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: Container(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            inforProduct(pro: widget.pro!, context: context),
            10.heightBox,
          ],
        ),
      )),
    );
  }
}
