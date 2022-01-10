import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_app_3/widgets/meal_item.dart';

import '../cubit/favorites_meals_cubit.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO make remove meal from favorites animated
    return BlocBuilder<FavoritesMealsCubit, FavoritesMealsState>(
      builder: (context, state) {
        return state.meals.isEmpty
            ? const Center(
                child: Text('Your have no favorites yet - start adding some!'),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.meals.length,
                itemBuilder: (ctx, idx) => MealItem(
                  meal: state.meals[idx],
                  favorited: true,
                ),
              );
      },
    );
  }
}
