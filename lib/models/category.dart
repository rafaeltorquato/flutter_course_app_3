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
      return _smartfilter(filter.isGlutenFree, meal.isGlutenFree) &&
          _smartfilter(filter.isLactoseFree, meal.isLactoseFree) &&
          _smartfilter(filter.isVegan, meal.isVegan) &&
          _smartfilter(filter.isVegetarian, meal.isVegetarian);
    }).toList();
  }

  bool _smartfilter(bool b1, bool b2) {
    return (b1 && b1 == b2) || true;
  }
}
