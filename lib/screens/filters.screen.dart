import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const ROUTE_NAME = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;
  var isVegan = false;
  var isVegetarian = false;
  var isLactoseFree = false;

  Widget buildSwitchListTitle(
      String title, String subTitle, bool variable, Function changeValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        value: variable,
        onChanged: changeValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitchListTitle('Gluten free',
                    'Only include gluten free meal', isGlutenFree, (newVal) {
                  setState(() {
                    isGlutenFree = newVal;
                  });
                }),
                buildSwitchListTitle(
                    'Vegetarian', 'Only include Vegetarian meal', isVegetarian,
                    (newVal) {
                  setState(() {
                    isVegetarian = newVal;
                  });
                }),
                buildSwitchListTitle(
                    'Vegan', 'Only include Vegan meal', isVegan, (newVal) {
                  setState(() {
                    isVegan = newVal;
                  });
                }),
                buildSwitchListTitle('Lactose Free',
                    'Only include Lactose free meal', isLactoseFree, (newVal) {
                  setState(() {
                    isLactoseFree = newVal;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
