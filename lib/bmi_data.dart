import 'package:freezed_annotation/freezed_annotation.dart';

part 'bmi_data.freezed.dart';

@freezed
class BmiData with _$BmiData {
  const factory BmiData({
    // 身長
    required double height,
    // 体重
    required double weight,
    // 結果(BMI)
    required double result,
  }) = _BmiData;
}
