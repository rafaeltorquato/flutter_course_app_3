part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {
  final List<Category> categories;

  const CategoriesState(this.categories);
}

class CategoriesInitial extends CategoriesState {
  const CategoriesInitial(List<Category> categories) : super(categories);
}

class CategoriesFiltered extends CategoriesState {
  final MealFilter filter;
  const CategoriesFiltered(List<Category> categories, this.filter)
      : super(categories);
}
