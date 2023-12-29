import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calc App'),
      ),
      body: Center(
        // 画面全体のColumn
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'あなたのBMIは',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '18',
              style: TextStyle(
                // TODO: 結果によって色を変更する
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              // TODO: 計算結果によって文言を変更する
              '「低体重」です。',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
