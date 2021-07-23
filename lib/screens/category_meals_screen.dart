import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const ROUTE_NAME = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  var isFirstTime = false;
  String categoryTitle;
  List<Meal> categoryMeals;

  @override
  void didChangeDependencies() {
    if (!isFirstTime) {
      final args =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = args['title'];
      final categoryId = args['id'];
      categoryMeals = widget.availableMeals
          .where((element) => element.categories.contains(categoryId))
          .toList();
      isFirstTime = true;
    }

    super.didChangeDependencies();
  }

  void deleteMeal(id) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => MealItem(
            categoryMeals[index].id,
            categoryMeals[index].title,
            categoryMeals[index].imageUrl,
            categoryMeals[index].duration,
            categoryMeals[index].complexity,
            categoryMeals[index].affordability,
            deleteMeal),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
