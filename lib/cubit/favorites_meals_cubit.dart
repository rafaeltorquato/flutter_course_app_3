import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/meal.dart';

part 'favorites_meals_state.dart';

class FavoritesMealsCubit extends Cubit<FavoritesMealsState> {
  FavoritesMealsCubit() : super(FavoritesMealsInitialState());

  void add(Meal meal) {
    emit(FavoritesMealsAddedState([...state.meals, meal]));
  }

  void remove(Meal meal) {
    var list = [...state.meals];
    var removedIndex = list.indexOf(meal);
    list.removeAt(removedIndex);
    emit(FavoritesMealsRemovedState(list, removedIndex));
  }
}
