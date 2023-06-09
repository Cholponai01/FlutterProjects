import 'package:flutter/material.dart';
import 'package:sabak19_bmi_ulantuu/theme/app_colors.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: AppColors.navyBlueColor,
        child: child,
      ),
    );
  }
}
