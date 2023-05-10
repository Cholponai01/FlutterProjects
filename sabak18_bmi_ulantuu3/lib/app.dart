import 'package:flutter/material.dart';
import 'package:sabak18_bmi_ulantuu3/example.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const ForExample(),
    );
  }
}
