import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customTextField({String? title, String? hint, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(Colors.red).fontFamily('semibold').size(16).make(),
      5.heightBox,
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintStyle: TextStyle(
              fontFamily: 'semibold',
              color: Colors.white,
            ),
            hintText: hint!,
            isDense: true,
            fillColor: Colors.grey,
            filled: true,
            border: InputBorder.none,
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.red))),
      ),
      5.heightBox,
    ],
  );
}
