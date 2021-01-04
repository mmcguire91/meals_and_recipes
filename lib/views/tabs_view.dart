import 'package:flutter/material.dart';

import './favorites.dart';
import './categories_view.dart';

import '../widgets/hamburger_menu.dart';

//TabsView is the tab controller on the appbar

class TabsView extends StatefulWidget {
  @override
  _TabsViewState createState() => _TabsViewState();
}
//electing to define statefulWidget because we want the page to update based on user interaction

class _TabsViewState extends State<TabsView> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesView(),
      'title': 'Categories',
    }, //index = 0
    {
      'page': Favorites(),
      'title': 'Favorites',
    }, //index = 1
  ];
  //assign a widget to the index the user selects within a new List variable _pages which holds Map values of <String, Object> data types as indeces
  //ensure that the values defined here are tied to the order they appear in the items List of the BottomNavigationBar widget

  int _selectedPageIndex = 0;
  //the initial value of the index tied to which page the user will view
  //_selectedPageIndex = 0 --> 0 index value is tied to CategoriesView() which is defined in the items List of the BottomNavigationBar widget

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
//change the selected value of the index tied to List _pages which holds the views the user selects

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        //set the title to the mapped value of the _selectedPageIndex which selects the index defined in the _pages List and display the value of the ['title'] for the selected index
      ),
      drawer: HamburgerMenu(),
      body: _pages[_selectedPageIndex]['page'],
      //set the body according to the index value of which the user selects according to the ['page'] value of the selected Map index value
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          //onTap set the state of the _selectedPage Index to the value of the index the user selects
          backgroundColor: Theme.of(context).bottomAppBarColor,
          selectedItemColor: Theme.of(context).primaryColor,
          currentIndex: _selectedPageIndex,
          //need to feed the information back into the bottom navigation bar of the selected index
          // type: BottomNavigationBarType.fixed,
          //BottomNavigationBarType.fixed is the default value so it does not need to be explicitly defined
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            //index = 0
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
            //index = 1
          ]),
    );
  }
}

//appropriately map the tabs to display the appropriate view
//the logic must meet the order in which each is defined i.e. 1st tab = 1st listed widget in body
