// ignore_for_file: list_remove_unrelated_type

import 'package:get/get.dart';

import '../API/API_DATA/list_products/product.dart';
import '../view/cart/cart.dart';
import '../view/favorite/favorite.dart';
import '../view/profile/account.dart';
import '../view/profile/proflie.dart';

class Controller extends GetxController {
  // Use RxList to allow reactivity
  RxList<favorite> favoriteProducts = <favorite>[].obs;
  RxList<cart> cartProducts = <cart>[].obs;
  RxList<account> Account = <account>[].obs;
  bool checkLogin = false;
  late profile pro;
  var count = 0.obs;
  var cartCount = 0.obs;
  void addFavorite(product product) {
    favoriteProducts.add(favorite(pro: product));
    count++;
    update();
  }

  void setProfile(profile pro) => this.pro = pro;
  profile getProfile() => pro;
  void setCheckLogin({bool? check}) => this.checkLogin = check!;
  bool getCheckLogin() => checkLogin;
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

  void removeCart(cart? cart) {
    cartProducts
        .removeWhere((ca) => ca.getPro().getCode() == cart?.getPro().getCode());
    cartCount--;
    update();
  }

// tai khoan
  void addAccount({String? name, String? pass, String? email}) {
    Account.add(account(name: name!, email: email!, pass: pass!));
    update();
  }
}
