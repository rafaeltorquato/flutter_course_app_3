import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

import '../dummy/dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  final Category category;

  const CategoryMealsScreen({Key? key, required this.category})
      : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late List<Meal> mealsByCategory;

  @override
  void initState() {
    super.initState();
    mealsByCategory = dummyMeals
        .where((meal) => meal.categories.contains(widget.category.id))
        .toList();
  }

  void handleRemoveMeal(Meal meal) {
    setState(() {
      mealsByCategory.removeWhere((element) => element == meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(widget.category.title),
      ),
      body: Center(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: mealsByCategory.length,
          itemBuilder: (ctx, idx) => MealItem(
            meal: mealsByCategory[idx],
            onRemoveMeal: handleRemoveMeal,
          ),
        ),
      ),
    ));
  }
}
