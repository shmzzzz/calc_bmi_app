import 'package:calc_bmi_app/bmi_data.dart';
import 'package:calc_bmi_app/result.dart';
import 'package:calc_bmi_app/screen/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputScreen extends ConsumerWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heightFormKey = GlobalKey<FormState>();
    final weightFormKey = GlobalKey<FormState>();
    final TextEditingController heightController = TextEditingController();
    final TextEditingController weightController = TextEditingController();

    double height = 0.0;
    double weight = 0.0;


    // データの状態管理
    final bmiDataProvider = StateProvider((ref) {
      return const BmiData(
        height: 0.0,
        weight: 0.0,
        result: 0.0,
      );
    });

    return Center(
      // 画面全体のColumn
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 入力部分のColumn
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 身長入力を促す文言
                      const Text(
                        '身長',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 32),
                      Form(
                        key: heightFormKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: SizedBox(
                          width: 180,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  double.parse(value) == 0.0) {
                                return '身長を入力してください。';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.number,
                            controller: heightController,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              hintText: '165',
                              hintStyle: TextStyle(fontSize: 14),
                              prefixIcon: Icon(
                                Icons.height,
                              ),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              height = double.parse(value);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // 体重入力を促す文言
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        '体重',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 32),
                      Form(
                        key: weightFormKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: SizedBox(
                          width: 180,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  double.parse(value) == 0.0) {
                                return '体重を入力してください。';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.number,
                            controller: weightController,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              hintText: '55',
                              hintStyle: TextStyle(fontSize: 14),
                              prefixIcon: Icon(
                                Icons.monitor_weight,
                              ),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              weight = double.parse(value);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'kg',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // ボタン部分
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        heightController.text = '';
                        weightController.text = '';
                      },
                      style: ElevatedButton.styleFrom(),
                      child: const Text('クリア'),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (height == 0.0 || weight == 0.0) {
                          const snackBar = SnackBar(
                            content: Text('身長、体重を正しく入力してください。'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          // Notifierを取得
                          // 画面を触ったときの動作なので、Notifierをreadする
                          final resultNotifier =
                              ref.read(resultProvider.notifier);
                          // // stateを更新
                          // // final result = resultNotifier.calcBmi(height, weight);
                          final result = resultNotifier.calcBmi(height, weight);

                          // 更新前のデータ
                          final data = ref.read(bmiDataProvider);
                          // 更新後のデータ
                          final newData = data.copyWith(
                            height: height,
                            weight: weight,
                            result: result,
                          );

                          // 変更する
                          ref.read(bmiDataProvider.notifier).state = newData;

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                // return ResultScreen(result: result);
                                return ResultScreen(
                                  bmiData:
                                      ref.read(bmiDataProvider.notifier).state,
                                );
                              },
                            ),
                          );
                        }
                      },
                      child: const Text('計算'),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
