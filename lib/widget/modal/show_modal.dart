// ignore_for_file: prefer_const_constructors, unused_local_variable, unused_field, prefer_final_fields, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../API/API_DATA/list_products/product.dart';
import '../../controller/Controller.dart';

class ProductModal extends StatefulWidget {
  final product? pro;
  const ProductModal({Key? key, required this.pro}) : super(key: key);

  @override
  _ProductModalState createState() => _ProductModalState();
}

class _ProductModalState extends State<ProductModal> {
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
    });
  }

  double? _numOfProduct;
  int _selectedQuantity = 1;
  @override
  Widget build(BuildContext context) {
    double price = widget.pro!.getSale() == true
        ? double.parse(widget.pro!.getRedprice())
        : double.parse(widget.pro!.getWprice());
    final List<String> listColor = widget.pro!.getColorName();
    final List<String> listSize = widget.pro!.getSize();

    String? _selectedColor = listColor[0];
    String? _selectedSize = listSize[0];

    void _handleCartButtonPress(BuildContext context, product pro, _const) {
      // Register FavoriteController instance
      Get.put(Controller());
      // Get reference to Controller
      final controller = Get.find<Controller>();
      // Add product to favorites
      controller.addCart(
          product: widget.pro!,
          num: _const,
          color: _selectedColor!,
          size: _selectedSize!);
      // Navigate to FavoriteScreen
      // Get.to(FavoriteScreen());
      Get.snackbar(
        'Success',
        '${pro.getName()} has been added to cart!',
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
      );
    }

    return Container(
      height: 300,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('Choose colors'),
              trailing: Container(
                width: 150.0,
                height: 40,
                child: DropdownButtonFormField<String>(
                  value: _selectedColor,
                  items: listColor
                      .map((size) => DropdownMenuItem(
                            value: size,
                            child: size.text.black.size(8).make(),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() => _selectedColor = value),
                ),
              ),
            ),
            ListTile(
              title: Text('Choose size'),
              trailing: Container(
                width: 150.0,
                height: 40,
                child: DropdownButtonFormField<String>(
                  value: _selectedSize,
                  items: listSize
                      .map((size) => DropdownMenuItem(
                            value: size,
                            child: Text(
                              size,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() => _selectedSize = value),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white,
                        ),
                        iconColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.red,
                        ),
                        minimumSize: MaterialStateProperty.all(Size(30, 30))),
                    onPressed: _decrementCount,
                    child: const Icon(
                      Icons.remove,
                    )),
                10.widthBox,
                Text(
                  '$_count',
                  style: TextStyle(fontSize: 12),
                ),
                10.widthBox,
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.white,
                      ),
                      iconColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red,
                      ),
                      minimumSize: MaterialStateProperty.all(Size(30, 30))),
                  onPressed: _incrementCount,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            10.heightBox,
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 242),
                borderRadius: BorderRadius.circular(10),
              ),
              child: '\$  ${(_count * price).toStringAsFixed(2)}'
                  .text
                  .fontFamily('bold')
                  .size(16)
                  .color(Colors.red)
                  .make(),
            ),
            10.heightBox,
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 30)),
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.red,
                ),
                iconColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.white,
                ),
              ),
              onPressed: _count > 0
                  ? () => _handleCartButtonPress(context, widget.pro!, _count)
                  : null,
              child: Text('Add to cart'),
            ),
          ],
        ),
      ),
    );
  }
}
