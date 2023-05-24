import '../../API/API_DATA/list_products/product.dart';

List<String> ListImage({product? pro}) {
  List<String> list = [];
  list.add(pro!.getImgUrl());
  for (int i = 0; i < pro.getListImg().length; i++) {
    list.add(pro.getListImg()[i]);
  }
  for (int i = 0; i < pro.getColorPImage().length; i++) {
    list.add(pro.getColorPImage()[i]);
  }
  return list;
}
