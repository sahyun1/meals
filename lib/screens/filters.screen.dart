import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const ROUTE_NAME = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: const MainDrawer(),
      body: Text('Body'),
    );
  }
}
