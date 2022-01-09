import 'package:flutter/material.dart';

import '../widgets/favorites_list.dart';
import '../widgets/categories_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _widgets = const [
    CaregoriesGrid(),
    FavoritesList(),
  ];
  final _widgetsLabel = const [
    'Categories',
    'Favorites',
  ];
  int _selectedIndex = 0;

  void _handleTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_widgetsLabel[_selectedIndex]),
        ),
        body: _widgets[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            )
          ],
          onTap: _handleTap,
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }
}
