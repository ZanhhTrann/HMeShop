import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../const/String.dart';
import '../../widget/button/our_button.dart';
import '../../widget/custom/custom_textfield.dart';
import '../splash_screen/splash_screen.dart';
import 'SignUp_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
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
                customTextField(title: 'Email', hint: 'Email@gmail.com'),
                customTextField(title: 'Password', hint: "*********"),
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
                      Get.to(() => SplashScreen());
                    }).box.width(context.screenWidth - 50).make(),
                5.heightBox,
                'Create New Account'.text.black.make(),
                5.heightBox,
                ourButton(
                    color: Colors.grey,
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
