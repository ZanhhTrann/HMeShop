// ignore_for_file: camel_case_types

class product {
  final String name;
  final String imgUrl;
  final String whitePrice;
  final String redPrice;
  final List<String> rgbColor;
  final bool sale;
  final List<String> colorName;
  final String code;
  final String description;
  final List<String> listImg;
  final String tagcode;
  final List<String> size;
  final List<String> colorPImage;
  final String categoryName;
  product({
    required this.name,
    required this.imgUrl,
    required this.whitePrice,
    required this.redPrice,
    required this.rgbColor,
    required this.sale,
    required this.colorName,
    required this.code,
    required this.description,
    required this.listImg,
    required this.tagcode,
    required this.colorPImage,
    required this.size,
    required this.categoryName,
  });

  String getName() => name;
  String getImgUrl() => imgUrl;
  String getWprice() => whitePrice;
  String getRedprice() => redPrice;
  List<String> getRgbColor() => rgbColor;
  bool getSale() => sale;
  List<String> getColorName() => colorName;
  String getCode() => code;
  String getDescription() => description;
  List<String> getListImg() => listImg;
  String getTagCode() => tagcode;
  List<String> getColorPImage() => colorPImage;
  List<String> getSize() => size;
  String getCategoryName() => categoryName;
}
