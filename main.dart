import 'package:flutter/material.dart';
import './navigation/data/category_meals_data.dart';
import './navigation/models/meal.dart';

import './navigation/models/filter.dart';
import 'navigation/category_meal_detail_screen.dart';
import './navigation/category_meals_screen.dart';
import 'navigation/tabs_bottom_screen.dart';
import 'navigation/filters_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Filters filters = Filters();
  List<Meal> meals = mealsData;
  List<Meal> favoriteMeals = [];

  void setFilters(Filters f) {
    setState(() {
      filters.glutenFree = f.glutenFree;
      filters.lactoseFree = f.lactoseFree;
      filters.vegan = f.vegan;
      filters.isVegeterian = f.isVegeterian;

      meals = mealsData.where((element) {
        if (f.glutenFree && !element.isGlutenFree) return false;
        if (f.lactoseFree && !element.isLactoseFree) return false;
        if (f.vegan && !element.isVegan) return false;
        if (f.isVegeterian && !element.isVegetarian) return false;

        return true;
      }).toList();
    });
  }

  void setFavorite(Meal favMeal) {
    int index = favoriteMeals.indexWhere((element) => element.id == favMeal.id);

    if (index >= 0) {
      setState(() => favoriteMeals.removeAt(index));
      return;
    }

    setState(() => favoriteMeals.add(favMeal));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: TabsBottomScreen(favoriteMeals),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      ),
      routes: {
        '/': (context) => TabsBottomScreen(favoriteMeals),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(meals),
        CategoryMealDetail.routeName: (context) =>
            CategoryMealDetail(setFavorite, favoriteMeals),
        FiltersScreen.routeName: (context) => FiltersScreen(setFilters, filters)
      },
    );
  }
}

void main() => runApp(const MyApp());
