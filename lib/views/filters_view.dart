import 'package:flutter/material.dart';

import '../widgets/hamburger_menu.dart';

class FiltersView extends StatelessWidget {
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: HamburgerMenu(),
      body: Center(
        child: Text('Filters'),
      ),
    );
  }
}
