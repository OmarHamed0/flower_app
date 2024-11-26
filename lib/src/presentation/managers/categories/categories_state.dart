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
  final String message;
  CategoriesError(this.message);
}

class ChangeCategory extends CategoriesState {
  String? id;
  ChangeCategory(this.id);
}
