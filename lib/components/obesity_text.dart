import 'package:calc_bmi_app/constants/dimens.dart';
import 'package:flutter/material.dart';

class ObesityText extends StatelessWidget {
  const ObesityText({super.key, required this.text, required this.textColor});

  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: TextSize.size_20,
        color: textColor,
      ),
    );
  }
}
