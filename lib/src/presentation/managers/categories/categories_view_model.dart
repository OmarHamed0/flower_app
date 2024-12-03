import 'package:bloc/bloc.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:flower_app/src/domain/entities/category_entity/category_entity.dart';
import 'package:flower_app/src/domain/use_cases/category_use_case.dart';
import 'package:flower_app/src/presentation/managers/categories/categories_action.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

@injectable
class CategoriesViewModel extends Cubit<CategoriesState> {
  final CategoryUseCase _categoryUseCase;
  CategoriesViewModel(this._categoryUseCase) : super(CategoriesInitial());
  List<CategoryEntity> categories = [CategoryEntity(name: "All")];
  int selectedIndex = 0;
  void _getCategories() async {
    var response = await _categoryUseCase.getCategory();
    switch (response) {
      case Success<List<CategoryEntity>>():
        categories.addAll(response.data!);
        emit(CategoriesLoaded(categories));
        break;
      case Failures<List<CategoryEntity>>():
        emit(
          CategoriesError(
            ErrorHandler.fromException(response.exception).errorMassage,
          ),
        );
        break;
    }
  }

  void doAction(CategoriesAction action) {
    switch (action) {
      case GetCategoriesAction():
        _getCategories();
        break;
      case ResetCategoriesAction():
        emit(CategoriesInitial());
        _getCategories();
        break;
      case ChangeCategoryAction():
        selectedIndex = action.index!;
        emit(ChangeCategoryState(categories[action.index].id));
        break;
    }
  }
}
