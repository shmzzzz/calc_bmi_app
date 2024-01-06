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
    const defaultColor = Colors.black;

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
                const ObesityText(
                  text: '「',
                  textColor: defaultColor,
                ),
                ObesityText(
                  text: obesity,
                  textColor: textColor,
                ),
                const ObesityText(
                  text: '」です。',
                  textColor: defaultColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ObesityText extends StatelessWidget {
  const ObesityText({super.key, required this.text, required this.textColor});

  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        color: textColor,
      ),
    );
  }
}
