import 'package:calc_bmi_app/components/obesity_text.dart';
import 'package:calc_bmi_app/constants/colors.dart';
import 'package:calc_bmi_app/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultState = ref.watch(resultProvider);
    final resultNotifier = ref.watch(resultProvider.notifier);
    final obesity = resultNotifier.changeObesity(resultState);
    final textColor = resultNotifier.changeTextColor(obesity);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calc App'),
      ),
      body: Center(
        // 画面全体のColumn
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'あなたのBMIは',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$resultState',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ObesityText(
                  text: '「',
                  textColor: TextColors.black,
                ),
                ObesityText(
                  text: obesity,
                  textColor: textColor,
                ),
                ObesityText(
                  text: '」です。',
                  textColor: TextColors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
