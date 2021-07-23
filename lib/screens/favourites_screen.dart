import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  // const FavouritesScreen({ Key? key }) : super(key: key);

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(child: Text('Add meals'));
    } else {
      return ListView.builder(
        itemBuilder: (context, index) => MealItem(
            favouriteMeals[index].id,
            favouriteMeals[index].title,
            favouriteMeals[index].imageUrl,
            favouriteMeals[index].duration,
            favouriteMeals[index].complexity,
            favouriteMeals[index].affordability),
        itemCount: favouriteMeals.length,
      );
    }
  }
}
