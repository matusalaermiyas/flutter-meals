import 'package:flutter/material.dart';
import 'package:playground/navigation/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.grey,
      child: SafeArea(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text(
              'Cooking Up',
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            alignment: Alignment.centerLeft,
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.food_bank,
              size: 26,
            ),
            title: const Text(
              'Meals',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 26,
            ),
            title: const Text(
              'Filters',
              style: TextStyle(
                  fontFamily: 'RobotCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(FiltersScreen.routeName),
          )
        ],
      )),
    );
  }
}
