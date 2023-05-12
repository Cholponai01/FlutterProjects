import 'package:flutter/material.dart';
import 'package:sabak19_bmi_ulantuu/theme/app_text_style.dart';

class MaleFemale extends StatelessWidget {
  MaleFemale({
    super.key,
    required this.icon,
    required this.text,
    required this.isTrue,
  });

  final IconData? icon;
  final String text;
  bool isTrue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isTrue ? Colors.red : null, size: 75),
        Text(text, style: AppTextStyles.titleStyle),
      ],
    );
  }
}
