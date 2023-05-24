import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget VSUrlImages({List<String>? list, BuildContext? context, bool? auto}) {
  return VxSwiper.builder(
      // aspectRatio: 18 / 9,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 5),
      enlargeCenterPage: auto!,
      height: MediaQuery.of(context!).size.height * 0.4,
      itemCount: list!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (_) {
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: Hero(
                      tag: 'imageHero',
                      child: Image.network(list[index])
                          .box
                          .clip(Clip.antiAlias)
                          .rounded
                          .margin(const EdgeInsets.symmetric(horizontal: 8))
                          .make(),
                    ),
                  ),
                );
              },
            ));
          },
          child: Image.network(
            list[index],
          )
              .box
              .clip(Clip.antiAlias)
              .rounded
              .margin(const EdgeInsets.symmetric(horizontal: 8))
              .make(),
        );
      });
}
