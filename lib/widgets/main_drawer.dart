import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';
import '../screens/home_screen.dart';
import '../utils/route_animations.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  void goToMeals(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      RouteAnimations.fadeIn(
        (context, animation, secondaryAnimation) => const HomeScreen(),
      ),
    );
  }

  void goToFilters(BuildContext context) {
    Navigator.pushNamed(context, FiltersScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const Divider(),
          // const SizedBox(
          //   height: 20,
          // ),
          // MenuItem(
          //   Icons.restaurant,
          //   'Meals',
          //   onTap: () => goToMeals(context),
          // ),
          const SizedBox(
            height: 20,
          ),
          MenuItem(
            Icons.settings,
            'Filters',
            onTap: () => goToFilters(context),
          )
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const MenuItem(
    this.iconData,
    this.title, {
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}
