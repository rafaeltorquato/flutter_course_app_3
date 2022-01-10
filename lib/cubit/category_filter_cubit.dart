import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/meal_filter.dart';

part 'category_filter_state.dart';

class CategoryFilterCubit extends Cubit<CategoryFilterState> {
  CategoryFilterCubit() : super(CategoryFilterInitial());

  changedGlutenFree(bool value) {
    emit(CategoryFilterChanged(state.filter.copyWith(isGlutenFree: value)));
  }

  changedLactoseFree(bool value) {
    emit(CategoryFilterChanged(state.filter.copyWith(isLactoseFree: value)));
  }

  changedVegan(bool value) {
    emit(CategoryFilterChanged(state.filter.copyWith(isVegan: value)));
  }

  changedVegetarian(bool value) {
    emit(CategoryFilterChanged(state.filter.copyWith(isVegetarian: value)));
  }
}
