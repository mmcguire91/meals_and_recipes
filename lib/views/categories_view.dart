import 'package:flutter/material.dart';

import '../dummy_data.dart';
import 'package:meals_and_recipes/widgets/category.dart';

class CategoriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => Category(
              title: catData.title,
              color: catData.color,
            ),
          )
          .toList(),
      //take the existing data and map to the Category UI component
    );
  }
}
