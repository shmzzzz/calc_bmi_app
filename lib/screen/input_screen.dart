import 'package:calc_bmi_app/components/clear_button.dart';
import 'package:calc_bmi_app/constants/dimens.dart';
import 'package:calc_bmi_app/constants/numbers.dart';
import 'package:calc_bmi_app/result.dart';
import 'package:calc_bmi_app/screen/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputScreen extends ConsumerWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heightFormKey = GlobalKey<FormState>();
    final weightFormKey = GlobalKey<FormState>();
    final TextEditingController heightController = TextEditingController();
    final TextEditingController weightController = TextEditingController();

    double height = Numbers.initial;
    double weight = Numbers.initial;

    ref.watch(resultProvider);

    void onCalculateButtonPressed(
      BuildContext context,
      WidgetRef ref,
      double height,
      double weight,
    ) {
      if (height == Numbers.initial || weight == Numbers.initial) {
        const snackBar = SnackBar(
          content: Text('身長、体重を正しく入力してください。'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        // Notifierを取得
        // 画面を触ったときの動作なので、Notifierをreadする
        final resultNotifier = ref.read(resultProvider.notifier);
        // 計算してstateを更新する
        resultNotifier.calcBmi(height, weight);

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const ResultScreen();
            },
          ),
        );
      }
    }

    return Center(
      // 画面全体のColumn
      child: Padding(
        padding: const EdgeInsets.all(Paddings.padding_16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 入力部分のColumn
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Paddings.padding_40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Form(
                        key: heightFormKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: SizedBox(
                          width: BoxSize.size_200,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  value.startsWith('.') ||
                                  double.parse(value) == Numbers.initial) {
                                return '身長を入力してください。';
                              } else {
                                return null;
                              }
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9.]') //数字とピリオドのみ入力可にする
                                  ),
                            ],
                            controller: heightController,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              labelText: '身長',
                              hintText: '165',
                              hintStyle: TextStyle(fontSize: TextSize.size_16),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              height = double.parse(value);
                            },
                          ),
                        ),
                      ),
                      const Text(
                        'cm',
                        style: TextStyle(
                          fontSize: TextSize.size_16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // 体重入力を促す文言
                const SizedBox(height: BoxSize.size_24),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Paddings.padding_40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Form(
                        key: weightFormKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: SizedBox(
                          width: BoxSize.size_200,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  value.startsWith('.') ||
                                  double.parse(value) == Numbers.initial) {
                                return '体重を入力してください。';
                              } else {
                                return null;
                              }
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9.]') //数字とピリオドのみ入力可にする
                                  ),
                            ],
                            controller: weightController,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              labelText: '体重',
                              hintText: '55',
                              hintStyle: TextStyle(fontSize: TextSize.size_16),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              weight = double.parse(value);
                            },
                          ),
                        ),
                      ),
                      const Text(
                        'kg',
                        style: TextStyle(
                          fontSize: TextSize.size_16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: BoxSize.size_32),
                // ボタン部分
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClearButton(
                      heightController: heightController,
                      weightController: weightController,
                    ),
                    const SizedBox(width: BoxSize.size_8),
                    ElevatedButton(
                      onPressed: () {
                        onCalculateButtonPressed(
                          context,
                          ref,
                          height,
                          weight,
                        );
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
