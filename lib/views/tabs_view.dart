import 'package:flutter/material.dart';

import './favorites.dart';
import './categories_view.dart';

//TabsView is the tab controller on the appbar

class TabsView extends StatefulWidget {
  @override
  _TabsViewState createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      body: null,
      bottomNavigationBar: BottomNavigationBar(
          onTap: null,
          backgroundColor: Theme.of(context).canvasColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ]),
    );
  }
}

//appropriately map the tabs to display the appropriate view
//the logic must meet the order in which each is defined i.e. 1st tab = 1st listed widget in body
