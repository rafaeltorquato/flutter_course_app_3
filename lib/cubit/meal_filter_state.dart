part of 'meal_filter_cubit.dart';

@immutable
abstract class MealFilterState {
  final MealFilter filter;

  const MealFilterState(this.filter);
}

class MealFilterInitial extends MealFilterState {
  MealFilterInitial() : super(MealFilter());
}

class MealFilterChanged extends MealFilterState {
  const MealFilterChanged(MealFilter filter) : super(filter);
}
