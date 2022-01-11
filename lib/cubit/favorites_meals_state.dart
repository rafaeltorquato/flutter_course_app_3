part of 'favorites_meals_cubit.dart';

@immutable
abstract class FavoritesMealsState {
  final List<Meal> meals;

  const FavoritesMealsState(this.meals);
}

class FavoritesMealsInitialState extends FavoritesMealsState {
  FavoritesMealsInitialState() : super([]);
}

class FavoritesMealsAddedState extends FavoritesMealsState {
  const FavoritesMealsAddedState(List<Meal> meals) : super(meals);
}

class FavoritesMealsRemovedState extends FavoritesMealsState {
  final int removedIndex;
  const FavoritesMealsRemovedState(List<Meal> meals, this.removedIndex)
      : super(meals);
}
