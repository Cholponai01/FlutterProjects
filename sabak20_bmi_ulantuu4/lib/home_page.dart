import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sabak20_bmi_ulantuu4/components/calculate_button.dart';
import 'package:sabak20_bmi_ulantuu4/components/height.dart';
import 'package:sabak20_bmi_ulantuu4/components/male_female.dart';
import 'package:sabak20_bmi_ulantuu4/components/status_card.dart';
import 'package:sabak20_bmi_ulantuu4/components/weight_age.dart';
import 'package:sabak20_bmi_ulantuu4/theme/app_colors.dart';
import 'package:sabak20_bmi_ulantuu4/theme/app_texts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isTrue = true;
  int weight = 60;
  int age = 23;
  double height = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgcColor,
        title: const Center(
          child: Text(AppTexts.bmi),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 21, top: 32, right: 21, bottom: 41),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  StatusCard(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isTrue = true;
                        });
                      },
                      child: MaleFemale(
                        isTrue: isTrue,
                        icon: Icons.male,
                        text: AppTexts.male,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  StatusCard(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isTrue = false;
                        });
                      },
                      child: MaleFemale(
                        isTrue: !isTrue,
                        icon: Icons.female,
                        text: AppTexts.female,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            StatusCard(
              child: Height(
                text: AppTexts.height,
                text1: '${height.toInt()}',
                text2: 'cm',
                onChanged: (value) {
                  setState(() {
                    height = value;
                  });
                },
                height: height,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: Row(
                children: [
                  StatusCard(
                    child: WeightAge(
                      text: AppTexts.weight,
                      san: '$weight',
                      removeBasuu: () {
                        setState(() {
                          weight--;
                        });
                      },
                      addBasuu: () {
                        setState(() {
                          weight++;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  StatusCard(
                    child: WeightAge(
                      text: AppTexts.age,
                      san: '$age',
                      removeBasuu: () {
                        setState(() {
                          age--;
                        });
                      },
                      addBasuu: () {
                        setState(() {
                          age++;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CalculateButton(
        onPressed: () {
          final res = weight / pow(height / 100, 2);
          if (res <= 18.5) {
            print('Cиз арыксыз');
          } else if (res >= 18.6 && res <= 25) {
            print('Сиз нормалдуусуз');
          } else if (res >= 25.1 && res <= 30) {
            print('Сиз ашыкча салмактуусуз');
          } else {
            print('Сиз семизсиз');
          }
        },
      ),
    );
  }
}
