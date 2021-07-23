import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'models/meal.dart';
import 'screens/filters.screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'lactose': false,
    'vegetarian': false
  };

  List<Meal> availableMeals = DUMMY_MEALS;

  void setFilters(Map<String, bool> newFilters) {
    setState(() {
      _filters = newFilters;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
      // home: TabsScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.ROUTE_NAME: (ctx) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.ROUTE_NAME: (ctx) => MealDetailScreen(),
        FiltersScreen.ROUTE_NAME: (ctx) => FiltersScreen(_filters, setFilters)
      },

      // this is a dynamic way
      // onGenerateRoute: (settings) {
      //   print(settings);
      //   if(settings.name == 'A') {

      //   }
      //   return MaterialPageRoute(builder: (context) => CategoriesScreen());
      // },

      // this is for when normal route fail. As a fall back
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
