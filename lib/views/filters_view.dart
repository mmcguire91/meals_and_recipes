import 'package:flutter/material.dart';

import '../widgets/hamburger_menu.dart';

class FiltersView extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersViewState createState() => _FiltersViewState();
}

class _FiltersViewState extends State<FiltersView> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  Widget _filterSwitchListTile(String title, String description,
      bool currentValue, Function updatedValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updatedValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: HamburgerMenu(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Filter by dietary preferences and restrictions',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _filterSwitchListTile(
                  'Gluten-free',
                  'Filter by gluten-free',
                  _glutenFree,
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _filterSwitchListTile(
                  'Lactose-free',
                  'Filter by lactose-free',
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                _filterSwitchListTile(
                  'Vegetarian',
                  'Filter by vegetarian',
                  _vegetarian,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _filterSwitchListTile(
                  'Vegan',
                  'Filter by vegan',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
