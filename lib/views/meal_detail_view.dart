import 'package:flutter/material.dart';

import '../widgets/meal.dart';
import 'category_meals_view.dart';

class MealDetailView extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    //retrieve the value of the mealID from meal.dart

    return Scaffold(
      appBar: AppBar(
        title: Text('$mealID'),
      ),
    );
  }
}
