import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmeshop/view/Login_SignUp/Login_check.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../const/String.dart';
import '../../controller/Controller.dart';
import '../../widget/button/our_button.dart';
import '../../widget/custom/custom_textfield.dart';
import '../splash_screen/splash_screen.dart';
import 'SignUp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _handleCartButtonPress({BuildContext? context}) {
    // Register FavoriteController instance
    Get.put(Controller());
    // Get reference to Controller
    final controller = Get.find<Controller>();
    controller.setCheckLogin(check: true);
    // Navigate to FavoriteScreen
    // Get.to(FavoriteScreen());
    Get.to(() => SplashScreen());
  }

  final controller = Get.find<Controller>();
  // id luu
  TextEditingController id = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            "Login to $eName"
                .text
                .fontFamily('bold')
                .color(Colors.red)
                .size(18)
                .make(),
            10.heightBox,
            Column(
              children: [
                customTextField(
                    title: 'Email',
                    hint: 'Email@gmail.com',
                    controller: id,
                    check: false),
                customTextField(
                    title: 'Password',
                    hint: "*********",
                    controller: pass,
                    check: true),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {}, child: 'Forget password'.text.make()),
                ),
                5.heightBox,
                ourButton(
                    color: Colors.red,
                    title: 'Login',
                    textColor: Colors.white,
                    onPress: () {
                      if (LoginCheck(eMail: id.text, pw: pass.text) == true)
                        _handleCartButtonPress(context: context);
                    }).box.width(context.screenWidth - 50).make(),
                5.heightBox,
                'Create New Account'.text.black.make(),
                5.heightBox,
                ourButton(
                    color: Color.fromARGB(255, 228, 228, 228),
                    title: 'Signup',
                    textColor: Colors.red,
                    onPress: () {
                      Get.to(() => const SignupScreen());
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
