import 'package:flutter/material.dart';

import 'models/dummy_data.dart';
import 'models/meal_data_model.dart';

import 'views/tabs_view.dart';
import 'views/categories_view.dart';
import 'views/category_meals_view.dart';
import 'views/meal_detail_view.dart';
import 'views/filters_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//Filters logic
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
          /* 
          IF
          the filter for gluten is set
         > _filters['gluten']
          AND
         > &&
          the meal is not gluten free
         > !meal.isGlutenFree
          We do not want to include it in the newly generated list
         > return false
          */
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        return true;
        //if none of the above conditions are met then display the meals
      }).toList();
    });
  }

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
              bodyText2: TextStyle(color: Color(0xFF2B2B2B), fontSize: 18.0),
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
        CategoryMealsView.routeName: (ctx) =>
            CategoryMealsView(_availableMeals),
        //updated naming convention path to reduce the chance of human error by mistyping a string
        MealDetailView.routeName: (ctx) => MealDetailView(),
        FiltersView.routeName: (ctx) => FiltersView(_filters, _setFilters),
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
