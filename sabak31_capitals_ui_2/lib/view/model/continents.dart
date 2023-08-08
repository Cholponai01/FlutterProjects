import 'package:flutter/material.dart';
import 'package:sabak31_capitals_ui_2/constants/app_colors.dart';

class Continents {
  const Continents({
    required this.name,
    required this.image,
    required this.color,
  });
  final String name;
  final String image;
  final Color color;
}

const Continents asia =
    Continents(name: 'Asia', image: 'asia', color: AppColors.asia);
const Continents africa =
    Continents(name: 'Africa', image: 'africa', color: AppColors.africa);
const Continents northAmerica = Continents(
    name: 'North America',
    image: 'northAmerica',
    color: AppColors.northAmercia);
const Continents southAmerica = Continents(
    name: 'South America',
    image: 'southAmerica',
    color: AppColors.southAmercia);
const Continents australia = Continents(
    name: 'Australia', image: 'australia', color: AppColors.australia);
const Continents europe =
    Continents(name: 'Europe', image: 'europe', color: AppColors.europe);

List<Continents> continentsList = [
  asia,
  africa,
  northAmerica,
  southAmerica,
  australia,
  europe,
];
