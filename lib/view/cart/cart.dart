import 'package:hmeshop/API/API_DATA/list_products/product.dart';

class cart {
  final product pro;
  int num;
  String color;
  String size;
  bool choose = false;
  cart(
      {required this.pro,
      required this.num,
      required this.color,
      required this.size});
  product getPro() => pro;
  int getNum() => num;
  String getColor() => color;
  String getSize() => size;
  bool getChoose() => choose;
  void setChoose(bool choose) => this.choose = choose;
  void addnum() => num++;
  void removeNum() => num > 0 ? num-- : num = num;
}
