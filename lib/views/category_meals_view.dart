import 'package:flutter/material.dart';

class CategoryMealsView extends StatelessWidget {
  // CategoryMealsView(this.categoryID, this.categoryTitle);

  // final String categoryID;
  // final String categoryTitle;
  //this would be required if you were trying to pass data through a non=-named route but since we are refactoring our code to named routes this is no longer necessary

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
