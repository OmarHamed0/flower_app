import 'package:bloc/bloc.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/api/core/requestes_models/cart/add_cart_request.dart';
import 'package:flower_app/src/domain/entities/cart/cart_entity.dart';
import 'package:flower_app/src/domain/use_cases/cart/get_logged_user_cart_use_case.dart';
import 'package:flower_app/src/domain/use_cases/cart/remove_specific_cart_item_use_case.dart';
import 'package:flower_app/src/presentation/managers/cart/cart_action.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../data/api/core/requestes_models/cart/cart_quantity_request.dart';
import '../../../domain/entities/cart/cart_product_entity.dart';
import '../../../domain/use_cases/cart/add_cart_use_case.dart';
import '../../../domain/use_cases/cart/update_quantity_cart_use_case.dart';

part 'cart_state.dart';

@injectable
class CartViewModel extends Cubit<CartState> {
  final AddCartUseCase addCartUseCase;
  final GetLoggedUserCartUseCase getLoggedUserCartUseCase;
  final RemoveSpecificCartItemUseCase removeSpecificUseCase;
  final UpdateQuantityCartUseCase updateQuantityCartUseCase;

  CartViewModel(this.addCartUseCase, this.getLoggedUserCartUseCase,
      this.removeSpecificUseCase, this.updateQuantityCartUseCase)
      : super(CartInitial());

  Future<void> doAction(CartAction cartAction) async {
    switch (cartAction) {
      case AddCartAction():
        return await addCart(
            productId: cartAction.productId, quantity: cartAction.quantity);
      case GetLoggedUserCartAction():
        return await _getLoggedUserCart();
      case RemoveSpecificCartItemAction():
        return await _removeSpecificItemCart(cartAction.cartProductEntity);
      case IncrementQuantityCartItemAction():
        return _incrementQuantity(cartAction.cartProductEntity);
      case DecrementQuantityCartItemAction():
        return _decrementQuantity(cartAction.cartProductEntity);
    }
  }

  Future<void> addCart(
      {required String productId, required int quantity}) async {
    emit(AddCartLoadingState());
    AddCartRequest addCartRequest =
        AddCartRequest(id: productId, quantity: quantity);
    var result = await addCartUseCase.invoke(addCartRequest: addCartRequest);
    switch (result) {
      case Success<CartEntity>():
        emit(AddCartSuccessState());
        break;
      case Failures<CartEntity>():
        emit(AddCartErrorState(exception: result.exception));
    }
  }

  List<CartProductEntity> cartProduct = [];
  num totalPrice = 0;
  Future<void> _getLoggedUserCart() async {
    emit(GetLoggedUserCartLoadingState());
    final result = await getLoggedUserCartUseCase.invoke();
    switch (result) {
      case Success<CartEntity>():
        cartProduct = result.data?.cartList ?? [];
        totalPrice = result.data?.totalPrice ?? 0;
        emit(GetLoggedUserCartSuccessState());
      case Failures<CartEntity>():
        emit(GetLoggedUserCartErrorState(exception: result.exception));
    }
  }

  Future<void> _removeSpecificItemCart(
      CartProductEntity cartProductEntity) async {
    emit(RemoveSpecificCartLoadingState());
    final result =
        await removeSpecificUseCase.invoke(id: cartProductEntity.id!);
    switch (result) {
      case Success<CartEntity>():
        _removeItemCart(cartProductEntity);
        totalPrice = result.data?.totalPrice ?? 0;
        emit(RemoveSpecificCartSuccessState());
      case Failures<CartEntity>():
        emit(RemoveSpecificCartErrorState(exception: result.exception));
    }
  }

  void _removeItemCart(CartProductEntity cartProductEntity) {
    cartProduct = List.from(cartProduct)
      ..removeWhere(
        (element) => element.id == cartProductEntity.id!,
      );
  }

  void _incrementQuantity(CartProductEntity cartProductEntity) {
    if (cartProductEntity.counterQuantity! < cartProductEntity.quantity!) {
      cartProductEntity.counterQuantity =
          cartProductEntity.counterQuantity! + 1;
      _updateQuantityItemCart(
          quantity: cartProductEntity.counterQuantity!,
          id: cartProductEntity.id!);
    }
  }

  void _decrementQuantity(CartProductEntity cartProductEntity) {
    if (cartProductEntity.counterQuantity! > 1) {
      cartProductEntity.counterQuantity =
          cartProductEntity.counterQuantity! - 1;
      _updateQuantityItemCart(
          quantity: cartProductEntity.counterQuantity!,
          id: cartProductEntity.id!);
    }
  }

  Future<void> _updateQuantityItemCart({
    required int quantity,
    required String id,
  }) async {
    emit(UpdateQuantityLoadingState());
    var result = await updateQuantityCartUseCase.invoke(
        cartQuantityRequest: CartQuantityRequest(quantity: quantity), id: id);
    switch (result) {
      case Success<CartEntity>():
        totalPrice = result.data?.totalPrice ?? 0;
        print("Update Total Price :$totalPrice");
        emit(UpdateQuantitySuccessState());
      case Failures<CartEntity>():
        emit(UpdateQuantityErrorState(exception: result.exception));
    }
  }
}
