import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';
import '../screens/filters_screen.dart';
import '../screens/home_screen.dart';
import '../screens/meal_detail_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (ctx) => const HomeScreen());
      case FiltersScreen.routeName:
        return MaterialPageRoute(builder: (ctx) => const FiltersScreen());
      case CategoryMealsScreen.routeNameWithArgs:
        return MaterialPageRoute(
            builder: (ctx) =>
                CategoryMealsScreen.withArgs(settings.arguments as Map));
      case MealDetailScreen.routeNameWithArgs:
        return MaterialPageRoute(
            builder: (ctx) =>
                MealDetailScreen.withArgs(settings.arguments as Map));
    }
    throw Exception('No route avaiable to ${settings.name}.');
  }
}
