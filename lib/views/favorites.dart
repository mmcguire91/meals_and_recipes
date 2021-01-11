import 'package:flutter/material.dart';

import '../models/meal_data_model.dart';

class Favorites extends StatelessWidget {
  Favorites(this.favoriteMeals);

  final List<Meal> favoriteMeals;
  //accept the list of favorite meals passed over from main.dart via tabsView

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('You do not have any favorites yet'),
    );
  }
}
