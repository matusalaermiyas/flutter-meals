import 'package:flutter/material.dart';
import './models/meal.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import './widgets/main_drawer.dart';

class TabsBottomScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsBottomScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  _TabsBottomScreenState createState() => _TabsBottomScreenState();
}

class _TabsBottomScreenState extends State<TabsBottomScreen> {
  List<Map<String, Object>> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': 'Categories', 'page': const CategoriesScreen()},
      {'title': 'Your Favorites', 'page': FavoritesScreen(widget.favoriteMeals)}
    ];
  }

  int _selectedIndex = 0;

  void _handleSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(title: Text(_screens[_selectedIndex]['title'] as String)),
      body: _screens[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.pinkAccent,
          unselectedItemColor: Colors.black45,
          onTap: _handleSelect,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites')
          ]),
    );
  }
}
