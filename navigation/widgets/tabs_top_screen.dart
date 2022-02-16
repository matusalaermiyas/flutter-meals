// import 'package:flutter/material.dart';
// import '../categories_screen.dart';
// import '../favorites_screen.dart';

// class TabsScreen extends StatefulWidget {
//   const TabsScreen({Key? key}) : super(key: key);

//   @override
//   _TabsScreenState createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('The Meals'),
//           bottom: const TabBar(tabs: [
//             Tab(
//               icon: Icon(Icons.category),
//               text: 'Categories',
//             ),
//             Tab(
//               icon: Icon(Icons.favorite),
//               text: 'Favorites',
//             )
//           ]),
//         ),
//         body:
//             const TabBarView(children: [CategoriesScreen(), FavoritesScreen()]),
//       ),
//     );
//   }
// }
