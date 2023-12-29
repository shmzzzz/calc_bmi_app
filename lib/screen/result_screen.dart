import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('結果画面'),
      ),
      body: const Center(
        // 画面全体のColumn
        child: Text('結果画面'),
      ),
    );
  }
}
