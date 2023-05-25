import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmeshop/view/Login_SignUp/Check/SignUp_check.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../const/String.dart';
import '../../controller/Controller.dart';
import '../../widget/button/our_button.dart';
import '../../widget/custom/custom_textfield.dart';
import 'Login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final controller = Get.find<Controller>();

  TextEditingController name = TextEditingController();
  TextEditingController pw = TextEditingController();
  TextEditingController rpw = TextEditingController();
  TextEditingController email = TextEditingController();
  bool? ischeck = false;
  @override
  Widget build(BuildContext context) {
    void _handleCartButtonPress(
        {BuildContext? context, String? pw, String? name, String? email}) {
      // Register FavoriteController instance
      Get.put(Controller());
      // Get reference to Controller
      final controller = Get.find<Controller>();
      // Add product to favorites
      controller.addAccount(email: email, name: name, pass: pw);
      // Navigate to FavoriteScreen
      // Get.to(FavoriteScreen());
      Get.to(() => LoginScreen());
    }

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
              "Join the $eName"
                  .text
                  .fontFamily('bold')
                  .color(Colors.red)
                  .size(18)
                  .make(),
              10.heightBox,
              Column(
                children: [
                  customTextField(
                      title: 'Name',
                      hint: 'Your name',
                      controller: name,
                      check: false),
                  customTextField(
                      title: 'Email',
                      hint: 'email@gmail.com',
                      controller: email,
                      check: false),
                  customTextField(
                      title: 'Password',
                      hint: '********',
                      controller: pw,
                      check: true),
                  customTextField(
                      title: 'Retype password',
                      hint: '*******',
                      controller: rpw,
                      check: true),
                  Row(
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.red,
                              value: ischeck,
                              onChanged: (newValue) {
                                setState(() {
                                  ischeck = newValue;
                                });
                              },
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "I agree to the ",
                                        style: TextStyle(
                                          fontFamily: 'regular',
                                          color: Colors.black,
                                        )),
                                    TextSpan(
                                        text: 'term And Cond',
                                        style: TextStyle(
                                          fontFamily: 'regular',
                                          color: Colors.red,
                                        )),
                                    TextSpan(
                                        text: " & ",
                                        style: TextStyle(
                                          fontFamily: 'regular',
                                          color: Colors.black,
                                        )),
                                    TextSpan(
                                        text: 'privacy Policy',
                                        style: TextStyle(
                                          fontFamily: 'regular',
                                          color: Colors.red,
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  5.heightBox,
                  ourButton(
                    color: ischeck == false ? Colors.grey : Colors.red,
                    title: 'Signup',
                    textColor: Colors.white,
                    onPress: () {
                      // print(email.toString());
                      // print(name.toString());
                      // print(pw.toString());
                      // print(rpw.toString());
                      if (SignUpCheck(
                              email: email.text,
                              name: name.text,
                              pw: pw.text,
                              rpw: rpw.text) ==
                          true) {
                        _handleCartButtonPress(
                            context: context,
                            pw: pw.text,
                            name: name.text,
                            email: email.text);
                        // Get.back();
                      } else {
                        Get.snackbar(
                          'False',
                          'to creat a Account!',
                          snackPosition: SnackPosition.TOP,
                          duration: const Duration(seconds: 3),
                        );
                      }
                    },
                  ).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Allready Have Account",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'regular',
                            ),
                          ),
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'regular',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).onTap(() {
                    Get.back();
                  }),
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
