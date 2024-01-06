import 'package:calc_bmi_app/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'result.g.dart';

@riverpod
class Result extends _$Result {
  @override
  double build() => 0.0;

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
        return Colors.blue;
      case ObeStrings.normalRange:
        return Colors.green;
      case ObeStrings.obeseClassOne:
        return const Color.fromARGB(255, 215, 200, 62);
      case ObeStrings.obeseClassTwo:
        return Colors.orange;
      case ObeStrings.obeseClassThree:
        return Colors.red;
      case ObeStrings.obeseClassFour:
        return Colors.purple;
      default:
        return Colors.black;
    }
  }
}
