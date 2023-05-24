// ignore_for_file: non_constant_identifier_names, unnecessary_string_interpolations, unused_import, prefer_interpolation_to_compose_strings, prefer_const_constructors, unnecessary_import, unused_local_variable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hmeshop/API/API_DATA/list_products/get_list_products.dart';
import 'package:hmeshop/API/API_DATA/list_products/product.dart';
import 'package:hmeshop/view/product/show_infor_product.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../API/API_DATA/category/category.dart';
import '../../view/product/sproduct.dart';
import '../colors/getColor.dart';

class VSProduct extends StatefulWidget {
  final String? name;
  final String? pagesize;
  final double? height;
  const VSProduct(
      {Key? key,
      required this.name,
      required this.height,
      required this.pagesize})
      : super(key: key);

  @override
  _VSProductState createState() => _VSProductState();
}

class _VSProductState extends State<VSProduct> {
  Future<List<product>>? _futureProduct;

  @override
  void initState() {
    super.initState();
    _futureProduct = getListProducts(
      name: widget.name,
      pagesize: widget.pagesize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<product>>(
      future: _futureProduct,
      builder: (context, list) {
        if (list.hasData && list.data != null && list.data!.isNotEmpty) {
          return VxSwiper.builder(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              enlargeCenterPage: true,
              viewportFraction: 0.7,
              height: widget.height,
              itemCount: list.data!.length,
              itemBuilder: (context, index) {
                return SProduct(
                        product: list.data![index], height: widget.height)
                    .onTap(() {
                  Get.to(() => showInforProduct(pro: list.data![index]));
                });
              });
        } else if (list.hasError) {
          return Text("${list.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
