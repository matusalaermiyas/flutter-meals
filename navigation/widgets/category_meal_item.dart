import 'package:flutter/material.dart';
import '../widgets/meal_info.dart';
import '../models/meal.dart';

class CategoryMealItem extends StatelessWidget {
  final Meal meal;
  final Function removeItem;

  const CategoryMealItem(this.meal, this.removeItem, {Key? key})
      : super(key: key);

  String get complexityType {
    switch (meal.complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityType {
    switch (meal.affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.luxurious:
        return 'Luxurious';
      case Affordability.pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  void handleSelectedMeal(BuildContext context) async {
    var result = await Navigator.of(context)
        .pushNamed('/meal-detail', arguments: {'id': meal.id});

    if (result != null) removeItem(result);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => handleSelectedMeal(context),
      splashColor: Colors.pink,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                  // Make the image be rounded like the parent
                  child: Image.asset(
                    'assets/images/toast.jpg',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              Positioned(
                top: 200,
                left: 80,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black45),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  width: 250,
                  // color: Colors.black45,
                  child: Text(
                    meal.title,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MealInfo(Icons.schedule, '${meal.duration} min'),
                MealInfo(Icons.work, complexityType),
                MealInfo(Icons.money, affordabilityType)
              ],
            ),
          )
        ]),
      ),
    );
  }
}
