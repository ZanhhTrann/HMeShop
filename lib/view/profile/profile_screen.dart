// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmeshop/view/Login_SignUp/Login_check.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controller/Controller.dart';
import '../../widget/button/our_button.dart';
import '../splash_screen/splash_screen.dart';
import 'account.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _handleCartButtonPress({BuildContext? context}) {
    // Register FavoriteController instance
    Get.put(Controller());
    // Get reference to Controller
    final controller = Get.find<Controller>();
    controller.setCheckLogin(check: false);
    // Navigate to FavoriteScreen
    // Get.to(FavoriteScreen());
    Get.to(() => SplashScreen());
    Get.snackbar(
      'Success',
      'To Log Out!',
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
    );
  }

  final controller = Get.find<Controller>();
  // id luu
  @override
  Widget build(BuildContext context) {
    final account acc = controller.getProfile().getAccount();
    return Container(
        child: Scaffold(
      // bo phan ke soc khi an ban phim
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (MediaQuery.of(context).size.height * 0.05).heightBox,
            Image.network(
              'https://th.bing.com/th/id/OIP.y-4YHSc6VhofvP2JE5xiQgHaE3?pid=ImgDet&w=512&h=337&rs=1',
              width: 40,
            ),
            10.heightBox,
            "Infor Account"
                .text
                .fontFamily('bold')
                .color(Colors.red)
                .size(18)
                .make(),
            10.heightBox,
            Column(
              children: [
                'Name: ${acc.name}'.text.color(Colors.red).make(),
                10.heightBox,
                'Email: ${acc.email}'.text.color(Colors.red).make(),
                5.heightBox,
                ourButton(
                    color: Colors.red,
                    title: 'LogOut',
                    textColor: Colors.white,
                    onPress: () {
                      _handleCartButtonPress(context: context);
                    }).box.width(context.screenWidth - 50).make(),
              ],
            )
                .box
                .white
                .rounded
                .padding(EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowSm
                .make()
          ],
        ),
      ),
    ));
  }
}
