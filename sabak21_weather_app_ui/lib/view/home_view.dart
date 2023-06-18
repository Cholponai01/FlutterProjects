import 'package:flutter/material.dart';
import 'package:sabak21_weather_app_ui/constants/app_text_styles.dart';

import 'package:sabak21_weather_app_ui/constants/app_colors.dart';

class MyHomeView extends StatefulWidget {
  const MyHomeView({super.key});

  @override
  State<MyHomeView> createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBgc,
        title: const Center(
            child: Text(
          'ТАПШЫРМА-09',
          style: AppTextStyles.titleStyle,
        )),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/image/bgImage.jpg'),
          ),
        ),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.near_me, color: AppColors.iconColor),
                Icon(Icons.location_city, color: AppColors.iconColor),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
              ),
              const Text('8', style: AppTextStyles.sanTextStyle),
              Image.asset(
                'assets/image/cloudImage.png',
                height: 100,
                width: 100,
              ),
            ],
          ),
          const SizedBox(height: 50),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'You\'ll\n need\n and',
              style: TextStyle(
                color: Colors.white,
                fontSize: 70,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Bishkek',
              style: TextStyle(color: Colors.white, fontSize: 70),
            ),
          )
        ]),
      ),
    );
  }
}
