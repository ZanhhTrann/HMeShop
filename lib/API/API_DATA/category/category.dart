// ignore_for_file: camel_case_types, avoid_print

class category {
  // lưu tên loại đồ
  final String catName;
  // tagcode để lưu mã tìm kiếm _ cái dùng để hiển danh sách sản phẩm
  final List<String> tagCodes;
  // danh sách các tiêu đề con
  final List<category> catArray;

  // cấu tử để khai báo biến
  category(
      {required this.catName, required this.tagCodes, required this.catArray});

  // lấy tên đồ
  String getCatName() => catName;
  // lấy tagcode
  List<String> getTagCodes() => tagCodes;
  // lấy danh sách con
  List<category> getCatArray() => catArray;

  void printTag({int? length}) {
    for (int i = 0; i < length!; i++) {
      print(tagCodes[i]);
    }
  }
}
