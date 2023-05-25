// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmeshop/API/API_DATA/list_products/product.dart';
import 'package:hmeshop/widget/modal/show_modal.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controller/Controller.dart';
import '../../view/favorite/favorite_screen.dart';
import '../List/list_Image.dart';
import '../Vxswiper/VS_url_Image.dart';
import '../colors/getColor.dart';

void _handleFavoriteButtonPress(BuildContext context, product pro) {
  // Register FavoriteController instance
  Get.put(Controller());
  // Get reference to Controller
  final controller = Get.find<Controller>();
  // Add product to favorites
  controller.addFavorite(pro);
  // Navigate to FavoriteScreen
  // Get.to(FavoriteScreen());

  // hiện  thông báo thêm thành công
  Get.snackbar(
    'Success',
    '${pro.getName()} has been added to favorites!',
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 3),
  );
}

Widget inforProduct({product? pro, BuildContext? context}) {
  List<String> list = ListImage(pro: pro!);
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      VSUrlImages(list: list, context: context!, auto: true),
      10.heightBox,
      pro
          .getName()
          .text
          .black
          .size(14)
          .fontFamily('bold')
          .make()
          .box
          .margin(EdgeInsets.only(left: 10))
          .make(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              5.heightBox,
              ("\$ ${pro.getWprice()}")
                  .text
                  .black
                  .size(8)
                  .fontFamily('semibold')
                  .make()
                  .box
                  .margin(EdgeInsets.only(left: 10))
                  .make(),
              5.heightBox,
              pro.getSale() == true
                  ? (('\$ ${pro.getRedprice()}')
                      .text
                      .size(14)
                      .fontFamily('semibold')
                      .color(Colors.red)
                      .make()
                      .box
                      .margin(EdgeInsets.only(left: 10))
                      .make())
                  : 0.heightBox
            ],
          ),
          IconButton(
              onPressed: () => _handleFavoriteButtonPress(context, pro),
              icon: Icon(Icons.favorite_border_outlined))
        ],
      ),
      5.heightBox,
      ListColors(full: true, list: pro.getRgbColor())
          .box
          .margin(EdgeInsets.only(left: 10))
          .make(),
      5.heightBox,

// nút thêm đồ vào giỏ hàng
      SizedBox(
        width: 100,
        height: 30,
        child: ElevatedButton(
          onPressed: () {
            // Xử lý khi nút được nhấn
            // ShowModal(pro: pro, context: context);
            showModalBottomSheet(
              context: context,
              builder: (context) => ProductModal(pro: pro),
              // ProductModal(pro: pro) hàm hiện menu để chọn màu, size , số lượng
            );
          },
          child: 'Add to cart'.text.size(8).make(),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFFF44336), // Màu chữ trên nút
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Góc bo tròn nút
            ),
          ),
        ),
      ).box.margin(EdgeInsets.only(left: 10)).make(),
      10.heightBox,
      Divider(
        indent: 10,
        endIndent: 10,
        color: Color.fromARGB(174, 0, 0, 0),
        thickness: 1,
        height: 10,
      ),
      pro
          .getDescription()
          .text
          .fontFamily('semibold')
          .size(8)
          .gray500
          .make()
          .box
          .margin(EdgeInsets.symmetric(horizontal: 10))
          .make(),
      10.heightBox,
      Image.network(pro.getListImg()[0], fit: BoxFit.cover),
      10.heightBox,
      Image.network(pro.getListImg()[1], fit: BoxFit.cover),
    ],
  );
}
