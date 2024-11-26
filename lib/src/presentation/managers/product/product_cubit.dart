import 'package:bloc/bloc.dart';
import 'package:flower_app/src/presentation/managers/product/product_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/api_result.dart';
import '../../../data/api/core/error/error_handler.dart';
import '../../../domain/entities/product_entity/product_entity.dart';
import '../../../domain/use_cases/product_use_cases/get_product_use_case.dart';
import 'core/product_core.dart';

part 'product_state.dart';
@injectable
class ProductCubit extends Cubit<ProductState> {
  final GetProductUseCase _getProductUseCase;

  ProductCubit(this._getProductUseCase,)
      : super(ProductInitial());

  Future<void> doAction(ProductEvent productEvent) async {
    switch (productEvent) {
      case GetProductEvent():
        return await _getProduct(
          productQueryParameters: productEvent.productQueryParameters
        );
    }
  }

  Future<void> _getProduct({
   required  ProductQueryParameters productQueryParameters
}) async {
    emit(GetProductLoadingState());
    var result = await _getProductUseCase.invoke(
        endpoint:productQueryParameters.productEndPoints,
         productId: productQueryParameters.productId,
         productQuery: productQueryParameters.productQuery,
    );

    switch (result) {
      case Success<List<ProductEntity>>():
           emit(GetProductSuccessState(products:result.data! ));
      case Failures<List<ProductEntity>>():
        String errorMassage = ErrorHandler.fromException(result.exception).errorMassage;
        emit(GetProductErrorState(errorMassage: errorMassage));
    }

  }

}
