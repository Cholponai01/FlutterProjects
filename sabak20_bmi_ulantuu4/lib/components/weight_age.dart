import 'package:flutter/material.dart';
import 'package:sabak20_bmi_ulantuu4/components/circular_button.dart';
import 'package:sabak20_bmi_ulantuu4/theme/app_text_style.dart';

class WeightAge extends StatelessWidget {
  const WeightAge({
    super.key,
    required this.text,
    required this.san,
    required this.removeBasuu,
    required this.addBasuu,
  });

  final String text;
  final String san;
  final void Function() removeBasuu;
  final void Function() addBasuu;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: AppTextStyles.titleStyle),
        Text(san, style: AppTextStyles.sanTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularButton(
              icon: Icons.remove,
              onPressed: removeBasuu,
            ),
            const SizedBox(
              width: 10,
            ),
            CircularButton(
              icon: Icons.add,
              onPressed: addBasuu,
            ),
          ],
        )
      ],
    );
  }
}
