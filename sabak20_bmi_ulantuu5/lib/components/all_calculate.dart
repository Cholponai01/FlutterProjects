import 'dart:math';

class BmiCalculator {
  double bmi({required double height, required int weight}) {
    final res = weight / pow(height / 100, 2);
    return res;
  }

  String bmiResult(res) {
    if (res <= 18.5) {
      // print('Cиз арыксыз');
      return 'Cиз арыксыз';
    } else if (res >= 18.6 && res <= 25) {
      // print('Сиз нормалдуусуз');
      return 'Нормалдуу';
    } else if (res >= 25.1 && res <= 30) {
      // print('Сиз ашыкча салмактуусуз');
      return 'Сиз ашыкча салмактуусуз';
    } else {
      // print('Сиз семизсиз');
      return 'Сиз семизсиз';
    }
  }

  String bmiDescription(res) {
    if (res <= 18.5) {
      // print('Cиз арыксыз');
      return 'Cиз арыксыз.Тамактануу норманызды карап коюнуз шарт!';
    } else if (res >= 18.6 && res <= 25) {
      // print('Сиз нормалдуусуз');
      return 'Сиздин дене салмагыныз нормалдуу.Азаматсыз!';
    } else if (res >= 25.1 && res <= 30) {
      // print('Сиз ашыкча салмактуусуз');
      return 'Сиз ашыкча салмактуу экенсиз,спорт менен алектениниз!!!';
    } else {
      // print('Сиз семизсиз');
      return 'Сиз семизсиз,срочно фитнес клубга барыныз!Аз жениз!!!';
    }
  }
}
