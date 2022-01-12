import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/favorites_meals_cubit.dart';
import '../models/meal_filter.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeNameWithArgs = '/category-meals-screen';
  static const String argCategory = 'category';
  static const String argFilter = 'filter';

  static CategoryMealsScreen withArgs(Map args) {
    return CategoryMealsScreen(
      category: args[argCategory] as Category,
      filter: args[argFilter] as MealFilter,
    );
  }

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
        child: BlocBuilder<FavoritesMealsCubit, FavoritesMealsState>(
          builder: (context, state) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: filteredMeals.length,
              itemBuilder: (ctx, idx) {
                Meal meal = filteredMeals[idx];
                return MealItem(
                  meal: meal,
                  favorited: state.meals.contains(meal),
                );
              },
            );
          },
        ),
      ),
    ));
  }
}
