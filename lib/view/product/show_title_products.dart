// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../API/API_DATA/category/category.dart';
import '../../widget/Gridview/grid_view_cat.dart';
import '../../widget/List/listCat.dart';
import '../../widget/appbar/build_Appbar.dart';
import '../../widget/search/search.dart';

class ShowTitleProduct extends StatefulWidget {
  final List<category>? list;
  final String? name;
  const ShowTitleProduct({Key? key, required this.list, required this.name})
      : super(key: key);

  @override
  State<ShowTitleProduct> createState() => _ShowTitleProductState();
}

class _ShowTitleProductState extends State<ShowTitleProduct> {
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
              widget.name!.text
                  .fontFamily('bold')
                  .black
                  .size(16)
                  .make()
                  .box
                  .margin(EdgeInsets.only(left: 20))
                  .make(),
              Search(cat: widget.list!),
              GridVP(cat: widget.list!)
            ],
          ),
        ));
  }
}
