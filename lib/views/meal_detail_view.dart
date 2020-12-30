import 'package:flutter/material.dart';

import '../models/dummy_data.dart';

class MealDetailView extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget sectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
  //extracted widget of sectionTitle

  Widget formattedContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF6ec6ff),
        borderRadius: BorderRadius.circular(10),
      ),
      //TODO: Refactor as MediaQuery
      margin: EdgeInsets.all(10.0),
      height: 250,
      width: 350,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    //retrieve the value of the mealID from meal.dart

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    //retrieve the properties associated with a meal according to the ID of the meal. Save to the variable selectedMeal

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                selectedMeal.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
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
    );
  }
}
