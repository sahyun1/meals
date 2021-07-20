import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const ROUTE_NAME = './meal-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Center(
        child: Text('$id'),
      ),
    );
  }
}
