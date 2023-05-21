import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sabak20_bmi_ulantuu5/components/calculate_button.dart';
import 'package:sabak20_bmi_ulantuu5/components/height.dart';
import 'package:sabak20_bmi_ulantuu5/components/male_female.dart';
import 'package:sabak20_bmi_ulantuu5/components/result_page.dart';
import 'package:sabak20_bmi_ulantuu5/components/status_card.dart';
import 'package:sabak20_bmi_ulantuu5/components/weight_age.dart';
import 'package:sabak20_bmi_ulantuu5/theme/app_colors.dart';
import 'package:sabak20_bmi_ulantuu5/theme/app_texts.dart';

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

  void results() {
    final res = weight / pow(height / 100, 2);
    if (res <= 18.5) {
      // print('Cиз арыксыз');
      _showAlertDialog(context, 'Cиз арыксыз');
    } else if (res >= 18.6 && res <= 25) {
      // print('Сиз нормалдуусуз');
      _showAlertDialog(context, 'Cиздин салмагыныз нормалдуу');
    } else if (res >= 25.1 && res <= 30) {
      // print('Сиз ашыкча салмактуусуз');
      _showAlertDialog(context, 'Cиз ашыкча салмактуусуз');
    } else {
      // print('Сиз семизсиз');
      _showAlertDialog(context, 'Сиз семизсиз');
    }
  }

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
          results();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(
                metri: height,
                salmak: weight,
              ),
            ),
          );
        },
      ),
    );
  }
}

Future<void> _showAlertDialog(BuildContext context, String text) async {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.navyBlueColor,
          title: const Text(
            AppTexts.bmi,
            textAlign: TextAlign.center,
          ),
          content: Text(
            text,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Чыгуу'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}
