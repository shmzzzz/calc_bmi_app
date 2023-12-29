import 'package:calc_bmi_app/screen/result_screen.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        child: SizedBox(
                          width: 180,
                          child: TextFormField(
                            // TODO: 入力値を数字のみに制限する
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              hintText: '165',
                              hintStyle: TextStyle(fontSize: 14),
                              prefixIcon: Icon(
                                Icons.height,
                              ),
                              border: OutlineInputBorder(),
                            ),
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
                        child: SizedBox(
                          width: 180,
                          child: TextFormField(
                            // TODO: 入力値を数字のみに制限する
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              hintText: '55',
                              hintStyle: TextStyle(fontSize: 14),
                              prefixIcon: Icon(
                                Icons.monitor_weight,
                              ),
                              border: OutlineInputBorder(),
                            ),
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
                      // TODO: 入力値をクリアする処理を記述する
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(),
                      child: const Text('クリア'),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      // TODO: タップで計算結果画面に遷移する
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const ResultScreen();
                            },
                          ),
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
