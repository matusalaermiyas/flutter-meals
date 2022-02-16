import 'package:flutter/material.dart';

import './models/meal.dart';
import './widgets/category_meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> meals;

  const CategoryMealsScreen(this.meals, {Key? key}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal> filteredData = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final categoryId = routeArgs['id'];

    categoryTitle = routeArgs['title'] as String;
    filteredData =
        widget.meals.where((m) => m.categories.contains(categoryId)).toList();
  }

  void removeItem(String id) {
    setState(() {
      filteredData.removeWhere((f) => f.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle as String)),
      body: ListView.builder(
        itemBuilder: ((context, index) =>
            CategoryMealItem(filteredData[index], removeItem)),
        itemCount: filteredData.length,
      ),
    );
  }
}
