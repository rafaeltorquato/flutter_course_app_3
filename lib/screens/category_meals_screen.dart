import 'package:flutter/material.dart';

import '../models/meal_filter.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  final Category category;
  final MealFilter filter;

  const CategoryMealsScreen(
      {Key? key, required this.category, required this.filter})
      : super(key: key);

  void handleRemoveMeal(BuildContext context, Meal meal) {}

  @override
  Widget build(BuildContext context) {
    List<Meal> filteredMeals = category.filterMeals(filter);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: filteredMeals.length,
          itemBuilder: (ctx, idx) => MealItem(
            meal: filteredMeals[idx],
          ),
        ),
      ),
    ));
  }
}
