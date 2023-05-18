import 'package:flutter/material.dart';
import 'package:sabak20_bmi_ulantuu5/components/example_floating_action_button.dart';
import 'package:sabak20_bmi_ulantuu5/home_page.dart';

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
