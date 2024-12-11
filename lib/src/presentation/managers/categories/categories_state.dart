part of 'categories_view_model.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}
class CategoriesLoading extends CategoriesState {}
class CategoriesLoaded extends CategoriesState {
  final List<CategoryEntity> categories;
  CategoriesLoaded(this.categories);
}

class CategoriesError extends CategoriesState {
  final Exception  exception;
  CategoriesError(this.exception);
}

class ChangeCategoryState extends CategoriesState {
  String? id;
  ChangeCategoryState(this.id);
}
