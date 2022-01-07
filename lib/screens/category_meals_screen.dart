import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

import '../dummy/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  final Category category;

  const CategoryMealsScreen({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Meal> mealsByCategory = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Expanded(
          child: ListView.builder(
            itemCount: mealsByCategory.length,
            itemBuilder: (ctx, idx) => MealItem(meal: mealsByCategory[idx]),
          ),
        ),
      ),
    ));
  }
}
