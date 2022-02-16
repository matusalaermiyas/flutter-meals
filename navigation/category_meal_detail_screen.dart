import 'package:flutter/material.dart';
import 'package:playground/navigation/models/meal.dart';

import './data/category_meals_data.dart';
import './widgets/render_title.dart';

class CategoryMealDetail extends StatefulWidget {
  static const routeName = '/meal-detail';
  final Function setFavorite;
  final List<Meal> favoriteMeals;

  const CategoryMealDetail(this.setFavorite, this.favoriteMeals, {Key? key})
      : super(key: key);

  @override
  State<CategoryMealDetail> createState() => _CategoryMealDetailState();
}

class _CategoryMealDetailState extends State<CategoryMealDetail> {
  void setIcon(Meal selectedMeal) {
    setState(() {
      widget.setFavorite(selectedMeal);
    });
  }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    final selectedMeal = mealsData.firstWhere((m) => m.id == data['id']);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: InkWell(
              child: widget.favoriteMeals.indexWhere(
                          (element) => element.id == selectedMeal.id) >=
                      0
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_outline_outlined),
              onTap: () => setIcon(selectedMeal),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () => Navigator.of(context).pop(data['id']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                'assets/images/spaghetti.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const RenderTitle('Ingredients'),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey)),
              width: double.infinity,
              height: 200,
              child: ListView.builder(
                itemBuilder: (itemBuilder, index) => SizedBox(
                  height: 50,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Text(
                        selectedMeal.ingredients[index],
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            const RenderTitle('Steps'),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey)),
              width: double.infinity,
              height: 300,
              padding: const EdgeInsets.only(bottom: 10.0),
              margin: const EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text(selectedMeal.steps[index]),
                ),
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
