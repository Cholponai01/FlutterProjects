import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sabak19_bmi_ulantuu/components/calculate_button.dart';
import 'package:sabak19_bmi_ulantuu/components/height.dart';
import 'package:sabak19_bmi_ulantuu/components/male_female.dart';
import 'package:sabak19_bmi_ulantuu/components/status_card.dart';
import 'package:sabak19_bmi_ulantuu/components/weight_age.dart';
import 'package:sabak19_bmi_ulantuu/theme/app_colors.dart';
import 'package:sabak19_bmi_ulantuu/theme/app_texts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isTrue = true;
  int weight = 0;
  int age = 0;
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
                  },
                  );
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
      bottomNavigationBar: const CalculateButton(),
    );
  }
}
