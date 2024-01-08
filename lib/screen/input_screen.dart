import 'package:calc_bmi_app/components/clear_button.dart';
import 'package:calc_bmi_app/components/height_text_form.dart';
import 'package:calc_bmi_app/components/weight_text_form.dart';
import 'package:calc_bmi_app/constants/dimens.dart';
import 'package:calc_bmi_app/constants/numbers.dart';
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
                // 身長入力欄
                HeightTextForm(
                  heightFormKey: heightFormKey,
                  heightController: heightController,
                  onChanged: (value) {
                    height = double.parse(value);
                  },
                ),
                const SizedBox(height: BoxSize.size_24),
                // 体重入力欄
                WeightTextForm(
                  weightFormKey: weightFormKey,
                  weightController: weightController,
                  onChanged: (value) {
                    weight = double.parse(value);
                  },
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
