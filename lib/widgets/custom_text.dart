import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomText(this.data, {Key? key, this.fontSize, this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
  }
}
