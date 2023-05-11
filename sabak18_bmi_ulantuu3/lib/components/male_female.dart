import 'package:flutter/material.dart';
import 'package:sabak18_bmi_ulantuu3/theme/app_text_style.dart';

class MaleFemale extends StatelessWidget {
  const MaleFemale({
    super.key,
    required this.icon,
    required this.text,
    required this.istrue,
  });

  final IconData? icon;
  final String text;
  final bool istrue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 75),
        Text(text, style: AppTextStyles.titleStyle),
      ],
    );
  }
}
