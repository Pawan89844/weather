import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final bool isBoldText;
  final String data;
  final FontWeight fontWeight;
  final double? fontSize;
  final Color? color;
  const AppText(this.data,
      {super.key,
      this.isBoldText = false,
      this.fontWeight = FontWeight.w700,
      this.fontSize,
      this.color});

  @override
  Widget build(BuildContext context) {
    if (isBoldText) {
      return Text(data,
          style: TextStyle(
              fontWeight: fontWeight,
              fontSize: fontSize ?? 25.0,
              color: color));
    } else {
      return Text(
        data,
        style: TextStyle(color: color),
      );
    }
  }
}
