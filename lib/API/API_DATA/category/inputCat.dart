// ignore_for_file: file_names, unused_local_variable

// hàm xử lý dữ liệu từ api trả về

import 'category.dart';

// cat: đối số nhận vào là body của dữ liệu trả về
List<category> inputCat({cat}) {
  // list lưu danh sách tên loại đồ
  List<category> list = [];
  // tagcode lưu danh sách các mã tìm kiếm
  List<String> tagcodes = [];
  // lưu danh sách các con của loại đồ
  List<category> catArray = [];
  // print(cat[0]['CategoriesArray'].length);

// xử lý dữ liệu
  for (int i = 0; i < cat.length; i++) {
    if (cat[i]['tagCodes'].length > 0) {
      // print(cat[0]['tagCodes'].length);
      for (int j = 0; j < cat[i]['tagCodes'].length; j++) {
        tagcodes.add(cat[i]['tagCodes'][j]);
        // print(tagcodes[j]);
      }
    }

    list.add(category(
      catName: cat[i]['CatName'],
      tagCodes: tagcodes,
      catArray: cat[i].containsKey('CategoriesArray') &&
              cat[i]['CategoriesArray'] != null
          ? inputCat(cat: cat[i]['CategoriesArray'])
          : [],
    ));
  }
  return list;
}
