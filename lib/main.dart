import 'package:flutter/material.dart';

import 'views/categories_view.dart';

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
      home: CategoriesView(),
    );
  }
}
