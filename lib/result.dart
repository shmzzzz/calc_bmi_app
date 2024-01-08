import 'package:calc_bmi_app/constants/colors.dart';
import 'package:calc_bmi_app/constants/numbers.dart';
import 'package:calc_bmi_app/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'result.g.dart';

@riverpod
class Result extends _$Result {
  @override
  double build() => Numbers.initial;

  void calcBmi(double height, double weight) {
    double calcHeight = height / 100.0;
    // BMI = 体重(kg) / (身長(m) * 身長(m))
    double bmi = weight / (calcHeight * calcHeight);
    // stateを更新する
    state = double.parse(bmi.toStringAsFixed(2));
  }

  String changeObesity(double result) {
    if (result < 18.5) return ObeStrings.underweight;
    if (result < 25) return ObeStrings.normalRange;
    if (result < 30) return ObeStrings.obeseClassOne;
    if (result < 35) return ObeStrings.obeseClassTwo;
    if (result < 40) return ObeStrings.obeseClassThree;
    return ObeStrings.obeseClassFour;
  }

  Color changeTextColor(String obesity) {
    switch (obesity) {
      case ObeStrings.underweight:
        return TextColors.blue;
      case ObeStrings.normalRange:
        return TextColors.green;
      case ObeStrings.obeseClassOne:
        return TextColors.yellow;
      case ObeStrings.obeseClassTwo:
        return TextColors.orange;
      case ObeStrings.obeseClassThree:
        return TextColors.red;
      case ObeStrings.obeseClassFour:
        return TextColors.purple;
      default:
        return TextColors.black;
    }
  }
}
