import 'package:flutter/material.dart';
import 'package:meals_and_recipes/views/categories_view.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$categoryTitle',
        ),
        //retrieve and display the applicable category title that was passed over via the selectCategory navigator method in category.dart
      ),
      body: Center(
        child: Text('text'),
      ),
    );
  }
}
