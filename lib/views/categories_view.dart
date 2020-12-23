import 'package:flutter/material.dart';

import '../models/dummy_data.dart';
import 'package:meals_and_recipes/widgets/category.dart';

//this is the UI for the Categories page view

class CategoriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: GridView(
        //GridView is meant as a body element that contains minor UI components and data
        padding: const EdgeInsets.all(20.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => Category(
                id: catData.id,
                title: catData.title,
                color: catData.color,
              ),
            )
            .toList(),
        //take the existing data and map to the Category UI component
      ),
    );
  }
}
