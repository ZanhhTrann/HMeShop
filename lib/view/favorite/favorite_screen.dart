// ignore_for_file: unused_import, unrelated_type_equality_checks, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hmeshop/API/API_DATA/list_products/product.dart';
import 'package:hmeshop/view/favorite/favorite.dart';
import 'package:hmeshop/widget/appbar/build_Appbar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controller/Controller.dart';
import '../../widget/modal/show_modal.dart';

class FavoriteScreen extends StatelessWidget {
  final controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: GetBuilder<Controller>(
        init: Controller(),
        builder: (controller) => controller.count != 0.obs
            ? ListView.builder(
                itemCount: controller.favoriteProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  final favoriteProduct = controller.favoriteProducts[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            favoriteProduct.getPro().getImgUrl(),
                            height: 100,
                          ),
                          10.widthBox,
                          favoriteProduct
                              .getPro()
                              .getName()
                              .text
                              .black
                              .fontFamily('semibold')
                              .size(8)
                              .make(),
                          10.widthBox,
                          "\$ ${favoriteProduct.getPro().getWprice()}"
                              .text
                              .black
                              .size(16)
                              .make(),
                        ],
                      )
                          .box
                          .roundedFull
                          .margin(EdgeInsets.symmetric(horizontal: 10))
                          .make(),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // Remove product from favorites list
                              // Add product to favorites
                              controller
                                  .removeFavorite(favoriteProduct.getPro());
                            },
                          ),
                          SizedBox(
                            width: 100,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                // Xử lý khi nút được nhấn
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => ProductModal(
                                      pro: favoriteProduct.getPro()),
                                );
                              },
                              child: 'Add to cart'.text.size(8).make(),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    Color(0xFFF44336), // Màu chữ trên nút
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Góc bo tròn nút
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  );
                },
              )
            : Center(
                child: "Favorites list is currently empty"
                    .text
                    .size(8)
                    .gray400
                    .make()),
      ),
    );
  }
}
