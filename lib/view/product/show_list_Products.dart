// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hmeshop/API/API_DATA/list_products/get_list_products.dart';
import 'package:hmeshop/API/API_DATA/list_products/product.dart';
import 'package:hmeshop/view/product/show_infor_product.dart';
import 'package:hmeshop/view/product/sproduct.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../API/API_DATA/category/category.dart';
import '../../widget/appbar/build_Appbar.dart';

class ShowListProducts extends StatefulWidget {
  final String? tagcode;
  final List<category>? cat;
  const ShowListProducts({Key? key, required this.tagcode, required this.cat})
      : super(key: key);
  @override
  State<ShowListProducts> createState() => _ShowListProductsState();
}

class _ShowListProductsState extends State<ShowListProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: FutureBuilder(
        future: getListProducts(name: widget.tagcode, pagesize: '4'),
        builder: (BuildContext context, AsyncSnapshot<List<product>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Nếu đang load dữ liệu từ API, hiển thị màn hình chờ
            return Center(child: CircularProgressIndicator());
          } else {
            // Nếu đã nhận được dữ liệu từ API, chuyển đến màn hình Home
            return Scaffold(
                body: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 12,
                                mainAxisExtent: 220),
                        itemBuilder: (context, index) {
                          return SProduct(
                                  product: snapshot.data![index], height: 220)
                              .box
                              .roundedSM
                              .make();
                        })));
          }
        },
      ),
    );
  }
}
