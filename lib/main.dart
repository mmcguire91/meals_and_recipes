import 'package:flutter/material.dart';

import 'views/categories_view.dart';
import 'views/category_meals_view.dart';
import 'views/meal_detail_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals and Recipes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.green,
        canvasColor: Colors.grey[200],
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.red),
              bodyText2: TextStyle(color: Colors.blueGrey),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesView(),
      initialRoute: '/',
      //default is '/'. this is most relevantif you want to start at a different view other than home
      routes: {
        '/': (ctx) => CategoriesView(),
        // '/' acts as home. If you are going to establish home under routes you must not define a property for home or comment it out
        CategoryMealsView.routeName: (ctx) => CategoryMealsView(),
        //updated naming convention path to reduce the chance of human error by mistyping a string
        MealDetailView.routeName: (ctx) => MealDetailView(),
      },
    );
  }
}
