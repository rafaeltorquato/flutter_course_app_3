import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/meal.dart';

part 'favorites_meals_state.dart';

class FavoritesMealsCubit extends Cubit<FavoritesMealsState> {
  FavoritesMealsCubit() : super(const FavoritesMealsState([]));

  void add(Meal meal) {
    emit(FavoritesMealsState([...state.meals, meal]));
  }

  void remove(Meal meal) {
    emit(FavoritesMealsState(state.meals..remove(meal)));
  }
}
