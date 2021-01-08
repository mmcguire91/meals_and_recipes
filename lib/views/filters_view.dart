import 'package:flutter/material.dart';

import '../widgets/hamburger_menu.dart';

class FiltersView extends StatefulWidget {
  static const routeName = '/filters';

  FiltersView(this.currentFilters, this.saveFilters);

  final Map<String, bool> currentFilters;
  //accepts the pass over data from _filters in main.dart

  final Function saveFilters;
  //accepts the pass over data from _setFilters in main.dart

  /*
we know that this will accept the data from _filters and _setFilters in main.dart due to the order in which they have been initialized
 
main.dart
FiltersView.routeName: (ctx) => FiltersView(_filters, _setFilters)

filters_view.dart
FiltersView(this.currentFilters, this.saveFilters)

_filters = currentFilters,
_setFilters = saveFilters
*/

  @override
  _FiltersViewState createState() => _FiltersViewState();
}

class _FiltersViewState extends State<FiltersView> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }
  //when the page initializes, set the state of the filers according to their current defined values

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
                //wiring and appropriately mapping the defined values in main.dart to the defined filters and UI interaction established in filters_view
              };
              widget.saveFilters(selectedFilters);
              //passing the data of the user selected filters back to saveFilters which passes back to _setFilters in the main.dart
            },
          ),
        ],
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
          Container(
            child: Text(
              'Remember to save for filters to apply',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
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
