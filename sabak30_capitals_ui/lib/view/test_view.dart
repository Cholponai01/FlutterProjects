import 'package:flutter/material.dart';
import 'package:sabak30_capitals_ui/constants/app_colors.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Container(
          height: 50,
          width: 80,
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 7,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 40,
        ),
        const Text(
          '3',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          width: 30,
        ),
        const Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        const Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        const Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        const Icon(Icons.more_vert),
      ]),
    );
  }
}
