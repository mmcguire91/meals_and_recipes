import 'package:flutter/material.dart';

import '../models/dummy_data.dart';

//MealDetailView is the UI for the Meal Detail page

class MealDetailView extends StatelessWidget {
  MealDetailView(this.toggleFavorite, this.isFavorite);

  static const routeName = '/meal-detail';

  final Function toggleFavorite; //accept _toggleFavorite from main.dart

  final Function isFavorite;

  Widget sectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
  //extracted widget of sectionTitle

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    //retrieve the value of the mealID from meal.dart

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    //retrieve the properties associated with a meal according to the ID of the meal. Save to the variable selectedMeal

    final mediaQuery = MediaQuery.of(context);

    Widget formattedContainer(Widget child) {
      return Container(
        decoration: BoxDecoration(
          color: Color(0xFF6ec6ff),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10.0),
        height: mediaQuery.size.height * 0.3,
        width: mediaQuery.size.width * 0.9,
        child: child,
      );
    }
    //extracted widget of formatted container

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //image
            Container(
              child: Image.network(
                selectedMeal.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            //Table to display ingredients & steps
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Table(
                    border: TableBorder.all(
                      width: 1.0,
                      color: Colors.black,
                    ),
                    defaultColumnWidth: FixedColumnWidth(150.0),
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 10.0,
                              ),
                              child: Text(
                                'Ingredients: ${selectedMeal.ingredients.length}',
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 10.0,
                              ),
                              child: Text(
                                'Steps: ${selectedMeal.steps.length}',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            sectionTitle(
              context,
              'Ingredients',
            ),
            formattedContainer(
              //Ingredients
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 10.0,
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('${selectedMeal.ingredients[index]}'),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            sectionTitle(
              context,
              'Directions',
            ),
            formattedContainer(
              //Directions / Steps
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        tileColor: Colors.white,
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).accentColor,
                          child: Text(
                            '# ${(index + 1)}',
                            //format the number icon to display at 1 instead of 0
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2B2B2B),
                            ),
                          ),
                        ),
                        title: Container(
                          color: Colors.white,
                          child: Text('${selectedMeal.steps[index]}'),
                        ),
                      ),
                      Divider(
                        height: 3.0,
                      ),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealID) ? Icons.star : Icons.star_border,
          color: Colors.white,
          //determine if the current mealID meets the logic defined in the isFavorite method
          //If true / yes, star should populate. If false / no, star should not populate
          // color: Colors.white,
        ),
        onPressed: () => toggleFavorite(mealID),
      ),
      //Favorite button => pressing this button will activate the toggleFavorite method passed over from _toggleFavorite established logic in main.dart
    );
  }
}
