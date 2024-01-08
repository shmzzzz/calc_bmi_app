import 'package:flutter/material.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({
    super.key,
    required this.heightController,
    required this.weightController,
  });

  final TextEditingController heightController;
  final TextEditingController weightController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        heightController.clear();
        weightController.clear();
      },
      child: const Text('クリア'),
    );
  }
}
