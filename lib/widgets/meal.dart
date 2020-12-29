import 'package:flutter/material.dart';

import '../models/meal_data_model.dart';
import '../views/meal_detail_view.dart';

//Class Meal holds the UI element and properties for each meal displayed on the category_meals_view

class Meal extends StatelessWidget {
  Meal({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.cost,
  });

  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Cost cost;

  String get complexityText {
    switch (complexity) {
      case Complexity.Easy:
        return 'Easy';
        break;
      case Complexity.Moderate:
        return 'Moderate';
        break;
      case Complexity.Difficult:
        return 'Difficult';
        break;
      default:
        return 'Undefined';
    }
  }
//interpolating enums into string values

  String get costText {
    switch (cost) {
      case Cost.Low:
        return 'Low';
        break;
      case Cost.Medium:
        return 'Medium';
        break;
      case Cost.High:
        return 'High';
        break;
      default:
        return 'Undefined';
    }
  }
//interpolating enums into string values

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailView.routeName,
      arguments: id,
    );
  }
  //navigator method to push to the MealDetailView

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4.0,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ), //ClipRRect wideget acts as container to format image according to the defined styling
                Positioned(
                  bottom: 20.0, //20 px from bottom
                  right: 10.0, //10 px from right
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    width: 300,
                    color: Colors.black54,
                    child: Text(
                      '$title',
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6.0),
                      Text('$duration mins'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6.0),
                      Text('$complexityText'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 6.0),
                      Text('$costText'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
