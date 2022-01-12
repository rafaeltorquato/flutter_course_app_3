import 'package:flutter/material.dart';

import '../utils/route_animations.dart';
import '../screens/category_meals_screen.dart';
import '../screens/filters_screen.dart';
import '../screens/home_screen.dart';
import '../screens/meal_detail_screen.dart';

class AppRouter {
  static Map map = {
    '/': (settings) => RouteAnimations.fadeIn(
          (c, a, a2) => const HomeScreen(),
        ),
    FiltersScreen.route: (settings) => RouteAnimations.fadeIn(
          (c, a, a2) => const FiltersScreen(),
        ),
    CategoryMealsScreen.routeWithArgs: (settings) => RouteAnimations.fadeIn(
          (c, a, a2) => CategoryMealsScreen.withArgs(settings.arguments as Map),
        ),
    MealDetailScreen.routeWithArgs: (settings) => RouteAnimations.fadeIn(
          (c, a, a2) => MealDetailScreen.withArgs(settings.arguments as Map),
        )
  };

  static Route generateRoute(RouteSettings settings) {
    return map[settings.name](settings);
  }
}
