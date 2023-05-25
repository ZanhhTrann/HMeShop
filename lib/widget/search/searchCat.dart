import 'package:get/get.dart';
import 'package:hmeshop/view/product/show_list_Products.dart';

import '../../API/API_DATA/category/category.dart';

void SearchCat({List<category>? cat, String? search}) {
  for (int i = 0; i < cat!.length; i++) {
    if (search!.toLowerCase() == cat[i].catName.toLowerCase()) {
      if (cat[i].getTagCodes().isNotEmpty) {
        print(cat[i].tagCodes[0]);
        Get.to(() => ShowListProducts(tagcode: cat[i].tagCodes[0], cat: cat));
        break;
      } else {
        if (cat[i].catArray.isNotEmpty) {
          Get.to(() => ShowListProducts(
              tagcode: cat[i].getCatArray()[0].tagCodes[0], cat: cat));

          print(cat[i].getCatArray()[0].tagCodes[0]);

          break;
        }
      }
    } else {
      if (cat[i].getCatArray().isNotEmpty) {
        SearchCat(cat: cat[i].getCatArray(), search: search);
      }
    }
  }
}
