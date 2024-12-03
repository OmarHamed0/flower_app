import 'package:bloc/bloc.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:flower_app/src/data/api/core/requestes_models/cart/add_cart_request.dart';
import 'package:flower_app/src/domain/entities/cart/cart_entity.dart';
import 'package:flower_app/src/presentation/managers/cart/cart_action.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_cases/cart/add_cart_use_case.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final AddCartUseCase addCartUseCase;
  CartCubit(this.addCartUseCase) : super(CartInitial());

  Future<void> doAction(CartAction cartAction) async {
    switch (cartAction) {
      case AddCartAction():
        return await addCart(
            productId: cartAction.productId, quantity: cartAction.quantity);
    }
  }

  Future<void> addCart(
      {required String productId, required int quantity}) async {
    AddCartRequest addCartRequest =
        AddCartRequest(id: productId, quantity: quantity);
    var result = await addCartUseCase.invoke(addCartRequest: addCartRequest);
    switch (result) {
      case Success<CartEntity>():
        emit(AddCartSuccessState());
        break;
      case Failures<CartEntity>():
        emit(AddCartErrorState(
            errorHandler: ErrorHandler.fromException(result.exception)));
    }
  }
}
