part of 'category_filter_cubit.dart';

@immutable
abstract class CategoryFilterState {
  final MealFilter filter;

  const CategoryFilterState(this.filter);
}

class CategoryFilterInitial extends CategoryFilterState {
  CategoryFilterInitial() : super(MealFilter());
}

class CategoryFilterChanged extends CategoryFilterState {
  const CategoryFilterChanged(MealFilter filter) : super(filter);
}
