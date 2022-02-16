import 'package:flutter/material.dart';

import './models/filter.dart';
import './widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Filters filters;

  const FiltersScreen(this.saveFilters, this.filters, {Key? key})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final filters = Filters();

  @override
  void initState() {
    filters.glutenFree = widget.filters.glutenFree;
    filters.isVegeterian = widget.filters.isVegeterian;
    filters.lactoseFree = widget.filters.lactoseFree;
    filters.vegan = widget.filters.vegan;

    super.initState();
  }

  void saveFilters() {
    widget.saveFilters(filters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(onPressed: saveFilters, icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text('Adjust your meals',
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          width: double.infinity,
        ),
        const Divider(),
        Expanded(
          child: ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    title: const Text(
                      'Is Gluten Free',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Only gluten free meals'),
                    value: filters.glutenFree,
                    onChanged: (value) =>
                        setState(() => filters.glutenFree = value),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    title: const Text(
                      'Is Lactose Free',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Only lactose free meals'),
                    value: filters.lactoseFree,
                    onChanged: (value) =>
                        setState(() => filters.lactoseFree = value),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    title: const Text(
                      'Is Vegeterian',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Only vegeterian meals'),
                    value: filters.isVegeterian,
                    onChanged: (value) =>
                        setState(() => filters.isVegeterian = value),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    title: const Text(
                      'Is Vegan',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Only vegan meals'),
                    value: filters.vegan,
                    onChanged: (value) => setState(() => filters.vegan = value),
                  )),
            ],
          ),
        )
      ]),
    );
  }
}
