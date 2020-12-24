import 'package:flutter/material.dart';

import '../models/dummy_data.dart';

class CategoryMealsView extends StatelessWidget {
  static const routeName = '/category-meals';
  //etablishes naming convention so that you can more easily reference the route

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryTitle = routeArguments['title'];

    final categoryID = routeArguments['id'];
    //establish route arguments to pass data over from one view to another via named routes

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryID);
    }).toList();
    //logic to display which meals map to which particular category when a category is pressed

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$categoryTitle',
        ),
        //retrieve and display the applicable category title that was passed over via the selectCategory navigator method in category.dart
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
