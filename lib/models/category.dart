import 'package:flutter/material.dart';

import '../models/meal_filter.dart';
import '../models/meal.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final List<Meal> meals;

  const Category({
    required this.id,
    required this.title,
    required this.meals,
    this.color = Colors.orange,
  });

  List<Meal> filterMeals(MealFilter filter) {
    return meals.where((meal) {
      return _smartFilter(filter.isGlutenFree, meal.isGlutenFree) &&
          _smartFilter(filter.isLactoseFree, meal.isLactoseFree) &&
          _smartFilter(filter.isVegan, meal.isVegan) &&
          _smartFilter(filter.isVegetarian, meal.isVegetarian);
    }).toList();
  }

  bool _smartFilter(bool b1, bool b2) {
    return (b1 && b1 == b2) || true;
  }
}
