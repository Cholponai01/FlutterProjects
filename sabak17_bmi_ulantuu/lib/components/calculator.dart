import 'package:flutter/material.dart';
import 'package:sabak17_bmi_ulantuu/theme/app_colors.dart';
import 'package:sabak17_bmi_ulantuu/theme/app_texts.dart';

class Calculator extends StatelessWidget {
  const Calculator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 73,
      width: double.infinity,
      color: AppColors.pinkColor,
      child: const Center(
          child: Text(
        AppTexts.calculator,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      )),
    );
  }
}
