import 'package:flutter/material.dart';
import 'package:hmeshop/API/API_DATA/category/get_Category.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../API/API_DATA/category/category.dart';
import '../../const/String.dart';
import '../home/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: GetCategory(),
        builder:
            (BuildContext context, AsyncSnapshot<List<category>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Nếu đang load dữ liệu từ API, hiển thị màn hình chờ
            return Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Column(
                    children: [
                      300.heightBox,
                      Image.network(
                        'https://th.bing.com/th/id/OIP.y-4YHSc6VhofvP2JE5xiQgHaE3?pid=ImgDet&w=512&h=337&rs=1',
                        width: 100,
                      ),
                      10.heightBox,
                      eName.text.fontFamily('bold').size(22).black.make(),
                      5.heightBox,
                      version.text.black.make(),
                      const Spacer(),
                      credits.text.black.fontFamily('semibold').make(),
                      30.heightBox,
                    ],
                  ),
                ));
          } else {
            // Nếu đã nhận được dữ liệu từ API, chuyển đến màn hình Home
            return Home(cat: snapshot.data);
          }
        },
      ),
    );
  }
}
