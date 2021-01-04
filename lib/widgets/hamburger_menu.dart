import 'package:flutter/material.dart';

import '../views/filters_view.dart';

class HamburgerMenu extends StatelessWidget {
  Widget hamburgerListTile(String title, IconData icon, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
  //listTile extracted to reduce reused code

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text(
            'Menu',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).canvasColor,
            ),
          ),
        ),
        hamburgerListTile(
            'Meals', //title
            Icons.restaurant, //icon
            () {
          Navigator.of(context).pushNamed('/'); //onTap
        }),
        hamburgerListTile(
            'Filter', //title
            Icons.settings, //icon
            () {
          Navigator.of(context).pushNamed(FiltersView.routeName); //onTap
        }),
      ],
    ));
  }
}
