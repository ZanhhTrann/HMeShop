// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hmeshop/view/cart/cart_screen.dart';
import 'package:hmeshop/view/favorite/favorite_screen.dart';

import '../../controller/Controller.dart';

PreferredSizeWidget buildAppbar() {
  final controller = Get.find<Controller>();
  return AppBar(
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    elevation: 0,
    backgroundColor: Colors.white,
    leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
    title: Image.network(
      'https://th.bing.com/th/id/OIP.y-4YHSc6VhofvP2JE5xiQgHaE3?pid=ImgDet&w=512&h=337&rs=1',
      width: 40,
    ),
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.person_3_outlined)),
      GetBuilder<Controller>(
        builder: (controller) {
          return IconButton(
            onPressed: () {
              Get.to(() => FavoriteScreen());
            },
            icon: Stack(
              children: [
                const Icon(Icons.favorite_outline),
                if (controller.count.value >= 0)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 10,
                        minHeight: 10,
                      ),
                      child: Text(
                        controller.count.value.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
      GetBuilder<Controller>(builder: (controller) {
        return IconButton(
          onPressed: () {
            Get.to(() => cartScreen());
          },
          icon: Stack(
            children: [
              const Icon(Icons.add_shopping_cart_outlined),
              if (controller.cartCount.value >= 0)
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 10,
                      minHeight: 10,
                    ),
                    child: Text(
                      controller.cartCount.value.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        );
      })
    ],
  );
}
