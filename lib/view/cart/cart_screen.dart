// ignore_for_file: unused_local_variable, use_key_in_widget_constructors, must_be_immutable, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controller/Controller.dart';
import '../../widget/appbar/build_Appbar.dart';

class cartScreen extends StatefulWidget {
  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  final controller = Get.find<Controller>();

  double _totalPrice = 0;

  @override
  void addTotalPrice(cart) {
    _totalPrice += (cart.getNum() *
        (cart.getPro().getSale() == true
            ? double.parse(cart.getPro().getRedprice())
            : double.parse(cart.getPro().getWprice())));
  }

  void removeTotalPrice(cart) {
    _totalPrice -= (cart.getNum() *
        (cart.getPro().getSale() == true
            ? double.parse(cart.getPro().getRedprice())
            : double.parse(cart.getPro().getWprice())));
  }

  void _incrementCount(cat) {
    setState(() {
      cat.addnum();
    });
  }

  void _decrementCount(cat) {
    setState(() {
      cat.removeNum();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: GetBuilder<Controller>(
        init: Controller(),
        builder: (controller) => controller.cartCount != 0.obs
            ? ListView.builder(
                itemCount: controller.cartProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              height: 20,
                              width: 20,
                              child: Checkbox(
                                checkColor: Colors.white,
                                activeColor: Colors.red,
                                value:
                                    controller.cartProducts[index].getChoose(),
                                onChanged: (value) {
                                  setState(() {
                                    // print(check[index]);
                                    // Sử dụng toán tử gán = ở đây để cập nhật giá trị cho biến
                                    controller.cartProducts[index].setChoose(
                                        !controller.cartProducts[index]
                                            .getChoose());
                                  });
                                  // Kiểm tra giá trị của Checkbox và cập nhật thêm hoặc xóa giá tiền trong hàm tương ứng.
                                  if (controller.cartProducts[index]
                                          .getChoose() ==
                                      true) {
                                    addTotalPrice(
                                        controller.cartProducts[index]);
                                  } else {
                                    removeTotalPrice(
                                        controller.cartProducts[index]);
                                  }
                                },
                              )),
                          10.widthBox,
                          Image.network(
                            controller.cartProducts[index].getPro().getImgUrl(),
                            height: 60,
                          ),
                          10.widthBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              controller.cartProducts[index]
                                  .getPro()
                                  .getName()
                                  .text
                                  .black
                                  .fontFamily('bold')
                                  .size(8)
                                  .make(),
                              "Color: ${controller.cartProducts[index].getColor()}"
                                  .text
                                  .black
                                  .fontFamily('semibold')
                                  .size(4)
                                  .make(),
                              "Size: ${controller.cartProducts[index].getSize()}"
                                  .text
                                  .black
                                  .fontFamily('semibold')
                                  .size(4)
                                  .make()
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                    (states) => Colors.white,
                                  ),
                                  iconColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.red,
                                  ),
                                  minimumSize:
                                      MaterialStateProperty.all(Size(10, 10))),
                              onPressed: () => _decrementCount(
                                  controller.cartProducts[index]),
                              child: const Icon(
                                Icons.remove,
                              )),
                          10.widthBox,
                          Text(
                            'Num : ${controller.cartProducts[index].getNum()}',
                            style: TextStyle(fontSize: 12),
                          ),
                          10.widthBox,
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) => Colors.white,
                                ),
                                iconColor: MaterialStateProperty.resolveWith(
                                  (states) => Colors.red,
                                ),
                                minimumSize:
                                    MaterialStateProperty.all(Size(10, 10))),
                            onPressed: () =>
                                _incrementCount(controller.cartProducts[index]),
                            child: const Icon(Icons.add),
                          ),

                          // gia tien
                          '\$ ${(controller.cartProducts[index].getNum() * (controller.cartProducts[index].getPro().getSale() == true ? double.parse(controller.cartProducts[index].getPro().getRedprice()) : double.parse(controller.cartProducts[index].getPro().getWprice()))).toStringAsFixed(2)}'
                              .text
                              .size(8)
                              .make(),
                        ],
                      )
                    ],
                  );
                })
            : Center(
                child:
                    "Cart list is currently empty".text.size(8).gray400.make(),
              ),
      )
          .box
          .margin(const EdgeInsetsDirectional.symmetric(horizontal: 10))
          .make(),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            'Total \$${_totalPrice.toStringAsFixed(2)}'
                .text
                .color(Colors.red)
                .fontFamily('bold')
                .size(16)
                .make(),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width * 0.5, 30)),
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.red,
                ),
                iconColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.white,
                ),
              ),
              onPressed: () {},
              child: Text('Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
