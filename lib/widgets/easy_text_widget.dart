import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/dimens.dart';

class EasyText extends StatelessWidget {
  const EasyText(
      {super.key,
      required this.text,
      this.fontWeight = FontWeight.bold,
      this.fontSize = kSP14x,
      this.textColor = kTextDefaultColor});
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: textColor,
      ),
    );
  }
}
