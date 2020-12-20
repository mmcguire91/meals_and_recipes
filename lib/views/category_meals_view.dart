import 'package:flutter/material.dart';

class CategoryMealsView extends StatelessWidget {
  CategoryMealsView(this.categoryID, this.categoryTitle);

  final String categoryID;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
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
