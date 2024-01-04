import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'result.g.dart';

@riverpod
class Result extends _$Result {
  @override
  double build() => 0.0;

  double calcBmi(double height, double weight) {
    double calcHeight = height / 100.0;
    // BMI = 体重(kg) / (身長(m) * 身長(m))
    double bmi = weight / (calcHeight * calcHeight);
    // 小数第二位まで返却する
    return double.parse(bmi.toStringAsFixed(2));
  }
}
