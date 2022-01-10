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
      return _smartCompare(filter.isGlutenFree, meal.isGlutenFree) &&
          _smartCompare(filter.isLactoseFree, meal.isLactoseFree) &&
          _smartCompare(filter.isVegan, meal.isVegan) &&
          _smartCompare(filter.isVegetarian, meal.isVegetarian);
    }).toList();
  }

  bool _smartCompare(bool b1, bool b2) {
    if (b1) return b2;
    return true;
  }
}
