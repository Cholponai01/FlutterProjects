import 'package:flutter/material.dart';

class FoodPixels extends StatelessWidget {
  const FoodPixels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
