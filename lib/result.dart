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
    if (result < 18.5) return '低体重';
    if (result < 25) return '普通体重';
    if (result < 30) return '肥満(1度)';
    if (result < 35) return '肥満(2度)';
    if (result < 40) return '肥満(3度)';
    return '肥満(4度)';
  }
}
