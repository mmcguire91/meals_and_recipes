import 'package:flutter/material.dart';
import 'package:meals_and_recipes/views/favorites.dart';

import './categories_view.dart';

//TabsView is the tab controller on the appbar

class TabsView extends StatefulWidget {
  @override
  _TabsViewState createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: 0,
      // initial index defines the tab that you want the user to see on initial load
      // the default logic is to display the view that is mapped to the 1st tab which is what we want so it isn't required that we specify that initial index = 0
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesView(),
            Favorites(),
          ],
        ),
        //appropriately map the tabs to display the appropriate view
        //the logic must meet the order in which each is defined i.e. 1st tab = 1st listed widget in body
      ),
    );
  }
}
