import 'package:flutter/material.dart';

import 'views/tabs_view.dart';
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
        accentColor: Color(0xFF6ec6ff),
        canvasColor: Colors.grey[200],
        bottomAppBarColor: Colors.grey[250],
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.red),
              bodyText2: TextStyle(color: Color(0xFF2B2B2B), fontSize: 20.0),
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
        '/': (ctx) => TabsView(),
        // '/' acts as home. If you are going to establish home under routes you must not define a property for home or comment it out
        // the initial view is defined as the tabs view but shows the CategoriesView. This is because of the logic defined within the DefaultTabController widget
        CategoryMealsView.routeName: (ctx) => CategoryMealsView(),
        //updated naming convention path to reduce the chance of human error by mistyping a string
        MealDetailView.routeName: (ctx) => MealDetailView(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesView(),
        );
      },
      //onUnknownRoute operates much like a 404 error
      //if the user were to click on an element that was not properly mapped, return user to xyz
    );
  }
}
