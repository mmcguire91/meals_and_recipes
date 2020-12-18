import 'package:flutter/material.dart';

//Class Category holds the UI for each Category UI element

class Category extends StatelessWidget {
  const Category({@required this.title, this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.7),
            color,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
