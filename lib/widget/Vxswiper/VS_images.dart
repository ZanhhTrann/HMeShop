// ignore_for_file: non_constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

Widget VSImages({
  list,
  height,
}) {
  return VxSwiper.builder(
      // aspectRatio: 18 / 9,
      autoPlay: true,
      enlargeCenterPage: true,
      height: height,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Image.asset(list[index], fit: BoxFit.fill)
            .box
            .clip(Clip.antiAlias)
            .rounded
            .margin(const EdgeInsets.symmetric(horizontal: 8))
            .make();
      });
}
