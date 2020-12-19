import 'package:flutter/material.dart';

import '../views/category_meals_view.dart';

//Class Category holds the UI for each Category UI element

class Category extends StatelessWidget {
  const Category({@required this.title, this.color});

  final String title;
  final Color color;

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return CategoryMealsView();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //gestureDetector substitute with UI ripple effect
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
