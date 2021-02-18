import 'package:flutter/material.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}
enum Price {
  Affordable,
  Pricey,
  HighPricey,
}

class Meal {
  final String id;
  final String title;
  final List<String> categories;
  final List<String> components;
  final String imageUrl;
  final List<String> steps;
  final Complexity complexity;
  final Price price;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.categories,
    @required this.components,
    @required this.imageUrl,
    @required this.steps,
    @required this.complexity,
    @required this.price,
    @required this.duration,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}
