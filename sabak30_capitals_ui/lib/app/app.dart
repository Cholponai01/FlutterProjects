import 'package:flutter/material.dart';
import 'package:sabak30_capitals_ui/constants/app_colors.dart';
import 'package:sabak30_capitals_ui/view/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: AppColors.appColor),
        scaffoldBackgroundColor: AppColors.scaffoldColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
