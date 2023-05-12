import 'package:flutter/material.dart';
import 'package:sabak19_bmi_ulantuu/components/example_floating_action_button.dart';
import 'package:sabak19_bmi_ulantuu/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}
