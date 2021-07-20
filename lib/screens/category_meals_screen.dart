import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = args['title'];
    final categoryId = args['id'];
    final cateogryMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => MealItem(
            cateogryMeals[index].title,
            cateogryMeals[index].imageUrl,
            cateogryMeals[index].duration,
            cateogryMeals[index].complexity,
            cateogryMeals[index].affordability),
        itemCount: cateogryMeals.length,
      ),
    );
  }
}
