import 'package:flutter/material.dart';

import '../views/category_meals_view.dart';

//Class Category holds the UI for each Category UI element

class Category extends StatelessWidget {
  const Category({this.id, @required this.title, this.color});

  final String id;
  final String title;
  final Color color;

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsView.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }
  //establish named route navigator method that will direct user to the CategoryMealsView page
  //arguments pass over data for id and title

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //gestureDetector substitute with UI ripple effect
      onTap: () => selectCategory(context),
      //call the selectCategory method that calls the selectCategory Navigator method that navigates to a different view
      splashColor: Theme.of(context).primaryColor,
      //color of the ripple effect
      borderRadius: BorderRadius.circular(15.0),
      //radius of the ripple effect => ensure this is the same as the container radius for ideal UI
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
