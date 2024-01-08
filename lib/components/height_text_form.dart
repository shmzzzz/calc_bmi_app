import 'package:calc_bmi_app/constants/dimens.dart';
import 'package:calc_bmi_app/constants/numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HeightTextForm extends StatelessWidget {
  const HeightTextForm({
    super.key,
    required this.heightFormKey,
    required this.heightController,
    required this.onChanged,
  });

  final GlobalKey<FormState> heightFormKey;
  final TextEditingController heightController;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Paddings.padding_40),
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
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  labelText: '身長',
                  hintText: '165',
                  hintStyle: TextStyle(fontSize: TextSize.size_16),
                  border: OutlineInputBorder(),
                ),
                onChanged: onChanged,
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
    );
  }
}
