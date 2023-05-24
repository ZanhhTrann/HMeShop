// ignore_for_file: list_remove_unrelated_type

import 'package:get/get.dart';

import '../API/API_DATA/list_products/product.dart';
import '../view/cart/cart.dart';
import '../view/favorite/favorite.dart';

class Controller extends GetxController {
  // Use RxList to allow reactivity
  RxList<favorite> favoriteProducts = <favorite>[].obs;
  RxList<cart> cartProducts = <cart>[].obs;
  var count = 0.obs;
  var cartCount = 0.obs;
  void addFavorite(product product) {
    favoriteProducts.add(favorite(pro: product));
    count++;
    update();
  }

  void addCart({product? product, int? num, String? color, String? size}) {
    cartProducts
        .add(cart(pro: product!, num: num!, color: color!, size: size!));
    cartCount++;
    update();
  }

  void removeFavorite(product? product) {
    favoriteProducts
        .removeWhere((fav) => fav.getPro().getCode() == product?.getCode());
    count--;
    update();
  }

  void removeCart(product? product) {
    cartProducts
        .removeWhere((ca) => ca.getPro().getCode() == product?.getCode());
    cartCount--;
    update();
  }
}
