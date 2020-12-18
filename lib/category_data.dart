import 'package:flutter/material.dart';

//Class CategoryData holds the data structure for the information housed in each category

class CategoryData {
  const CategoryData({@required this.id, @required this.title, this.color});

  final String id;
  final String title;
  final Color color;
}
