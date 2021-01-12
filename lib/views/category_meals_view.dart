import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal_data_model.dart';

class CategoryMealsView extends StatefulWidget {
  static const routeName = '/category-meals';

  CategoryMealsView(this.availableMeals);

  final List<Meal> availableMeals;
//display the applicable meals according to the user selected filters
//data is passed over from main.dart via _availableMeals

  @override
  _CategoryMealsViewState createState() => _CategoryMealsViewState();
}

class _CategoryMealsViewState extends State<CategoryMealsView> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedInitData = false;
  //variable to establish if it is the first time that the user is viewing the screen or if the user is returning to the screen via navigator.pop

  @override
  void didChangeDependencies() {
    if (_loadedInitData == false) {
      final routeArguments =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      categoryTitle = routeArguments['title'];

      final categoryID = routeArguments['id'];
      //establish route arguments to pass data over from one view to another via named routes

      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryID);
      }).toList();
      //logic to display which meals map to which particular category when a category is pressed
      //widget.availableMeals also accounts for the user selected filters

      _loadedInitData = true;
      //this variable is the foundation of this (not all) didChangeDependencies function. Now that the user is returning to this screen we are changing the value of this variable to true as in the user has viewed this page before
    }
    super.didChangeDependencies();
  }
  //if the user is seeing this view for the first time we run this function to display the appropriate meals

  void _removeMeal(String mealID) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealID);
    });
  }
  //remove meal function will remove a meal (displayedMeals) from the category_meals_view display where the id of the meal == the mealID that was just deleted from the floating action button in the meal_detail_view

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$categoryTitle',
        ),
        //retrieve and display the applicable category title that was passed over via the selectCategory navigator method in category.dart
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            cost: displayedMeals[index].cost,
            // removeItem: _removeMeal,
          ); //return and display the Meal widget according to the specified properties
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
