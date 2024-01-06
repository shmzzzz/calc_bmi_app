import 'package:calc_bmi_app/constants/constants.dart';
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
    if (result < 18.5) return Constants.underweight;
    if (result < 25) return Constants.normalRange;
    if (result < 30) return Constants.obeseClassOne;
    if (result < 35) return Constants.obeseClassTwo;
    if (result < 40) return Constants.obeseClassThree;
    return Constants.obeseClassFour;
  }

  Color changeTextColor(String obesity) {
    switch (obesity) {
      case Constants.underweight:
        return Colors.blue;
      case Constants.normalRange:
        return Colors.green;
      case Constants.obeseClassOne:
        return const Color.fromARGB(255, 215, 200, 62);
      case Constants.obeseClassTwo:
        return Colors.orange;
      case Constants.obeseClassThree:
        return Colors.red;
      case Constants.obeseClassFour:
        return Colors.purple;
      default:
        return Colors.black;
    }
  }
}
