import 'package:flutter/material.dart';

import '../widgets/favorites_list.dart';
import '../widgets/categories_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Meals'),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.category),
                      SizedBox(width: 5),
                      Text(
                        'Categories',
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.star),
                      SizedBox(width: 5),
                      Text('Favorites'),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: const TabBarView(children: [
            CaregoriesGrid(),
            FavoritesList(),
          ]),
        ),
      ),
    );
  }
}
