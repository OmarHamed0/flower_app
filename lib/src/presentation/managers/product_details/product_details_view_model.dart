import 'package:bloc/bloc.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:flower_app/src/domain/entities/product_entity/product_entity.dart';
import 'package:flower_app/src/domain/use_cases/product_use_cases/product_by_id_use_case.dart';
import 'package:flower_app/src/presentation/managers/product_details/product_details_actions.dart';
import 'package:flower_app/src/presentation/managers/product_details/product_details_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsViewModel extends Cubit<ProductDetailsStates> {
  final ProductByIdUseCase _productByIdUseCase;

  ProductDetailsViewModel(this._productByIdUseCase) : super(InitialState());
  ProductEntity? productEntity;

  void _getProductById({required String id}) async {
    emit(LoadingState());
    var response = await _productByIdUseCase.getProductById(id);
    switch (response) {
      case Success<ProductEntity>():
        productEntity = response.data;
        emit(SuccessState());
      case Failures<ProductEntity>():
        var error = ErrorHandler.fromException(response.exception);
        emit(FailedState(error: error.errorMassage));
    }
  }

  String checkStock(int quantity) {
    if (quantity > 0) {
      return "In Stock";
    } else {
      return "Out of Stock";
    }
  }

  void doAction(ProductDetailsActions action) {
    switch (action) {
      case GetProductByIdAction():
        _getProductById(id: action.productId!);
        break;
    }
  }
}
