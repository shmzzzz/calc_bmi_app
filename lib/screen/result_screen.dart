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
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '「$obesity」です。',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
