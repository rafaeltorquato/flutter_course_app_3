import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/meal_filter.dart';

part 'meal_filter_state.dart';

class MealFilterCubit extends Cubit<MealFilterState> {
  MealFilterCubit() : super(MealFilterInitial());

  changedGlutenFree(bool value) {
    emit(MealFilterChanged(state.filter.copyWith(isGlutenFree: value)));
  }

  changedLactoseFree(bool value) {
    emit(MealFilterChanged(state.filter.copyWith(isLactoseFree: value)));
  }

  changedVegan(bool value) {
    emit(MealFilterChanged(state.filter.copyWith(isVegan: value)));
  }

  changedVegetarian(bool value) {
    emit(MealFilterChanged(state.filter.copyWith(isVegetarian: value)));
  }
}
