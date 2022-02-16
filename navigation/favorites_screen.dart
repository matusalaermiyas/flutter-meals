import 'package:flutter/material.dart';
import './format_enums.dart';
import './widgets/meal_info.dart';
import './models/meal.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return const Center(
        child: Text(
          'You have no favorites start adding some, ',
          style: TextStyle(
              fontFamily: 'Ralewat', fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    }

    return ListView.builder(
      itemBuilder: (context, index) => InkWell(
        splashColor: Colors.pink,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black45),
                    child: Text(
                      widget.favoriteMeals[index].title,
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
                  MealInfo(Icons.schedule,
                      '${widget.favoriteMeals[index].duration} min'),
                  MealInfo(Icons.work,
                      complexityType(widget.favoriteMeals[index].complexity)),
                  MealInfo(
                      Icons.money,
                      affordabilityType(
                          widget.favoriteMeals[index].affordability))
                ],
              ),
            )
          ]),
        ),
      ),
      itemCount: widget.favoriteMeals.length,
    );
  }
}
