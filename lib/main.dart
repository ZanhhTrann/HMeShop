// ignore_for_file: use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmeshop/controller/Controller.dart';
import 'package:hmeshop/view/Login_SignUp/Login_screen.dart';
import 'package:hmeshop/view/home/home.dart';
import 'package:hmeshop/view/splash_screen/splash_screen.dart';

import 'view/product/show_title_products.dart';

void main() async {
  Get.put(Controller(), permanent: true);
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'H&M eShop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen());
    // home: LoginScreen());
  }
}
