import 'package:flutter/material.dart';

import '../models/meal_data_model.dart';

class Meal extends StatelessWidget {
  Meal({
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.cost,
  });

  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Cost cost;

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
