import 'package:flutter/foundation.dart';

enum Complexity {
  Easy,
  Moderate,
  Difficult,
}

enum Cost {
  //in course this is referred to as 'Affordability
  Low, // affordable
  Medium, // pricey
  High, // luxurious
}

class Meal {
  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.cost,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });

  final int id; //in course this value is datatype String
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Cost cost; //affordability
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
}
