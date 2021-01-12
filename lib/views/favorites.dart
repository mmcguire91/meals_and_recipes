import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

import '../models/meal_data_model.dart';

class Favorites extends StatelessWidget {
  Favorites(this.favoriteMeals);

  final List<Meal> favoriteMeals;
  //accept the list of favorite meals passed over from main.dart via tabsView

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You do not have any favorites yet'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            cost: favoriteMeals[index].cost,
          ); //return and display the Meal widget according to the specified properties
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
