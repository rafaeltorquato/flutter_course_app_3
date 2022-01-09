import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/meal_filter.dart';

part 'category_filter_state.dart';

class CategoryFilterCubit extends Cubit<CategoryFilterState> {
  CategoryFilterCubit() : super(CategoryFilterInitial());

  changedGlutenFree(bool value) {
    emit(CategoryFilterChanged(MealFilter(
        isGlutenFree: value,
        isLactoseFree: state.filter.isLactoseFree,
        isVegan: state.filter.isVegan,
        isVegetarian: state.filter.isVegetarian)));
  }

  changedLactoseFree(bool value) {
    emit(CategoryFilterChanged(MealFilter(
        isGlutenFree: state.filter.isGlutenFree,
        isLactoseFree: value,
        isVegan: state.filter.isVegan,
        isVegetarian: state.filter.isVegetarian)));
  }

  changedVegan(bool value) {
    emit(CategoryFilterChanged(MealFilter(
        isGlutenFree: state.filter.isGlutenFree,
        isLactoseFree: state.filter.isLactoseFree,
        isVegan: value,
        isVegetarian: state.filter.isVegetarian)));
  }

  changedVegetarian(bool value) {
    emit(CategoryFilterChanged(MealFilter(
        isGlutenFree: state.filter.isGlutenFree,
        isLactoseFree: state.filter.isLactoseFree,
        isVegan: state.filter.isVegan,
        isVegetarian: value)));
  }
}
