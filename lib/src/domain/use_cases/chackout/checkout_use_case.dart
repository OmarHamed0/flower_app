
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/address/address_model.dart';
import 'package:flower_app/src/domain/entities/cart/cart_entity.dart';
import 'package:flower_app/src/domain/repositories/address_repo/address_repository.dart';
import 'package:flower_app/src/domain/repositories/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckoutUseCases{
  final CartRepo _cartRepository;
  final AddressRepository _addressRepository;
  CheckoutUseCases(this._cartRepository, this._addressRepository);
  Future<ApiResult<CartEntity>> getLoggedUserCart() async {
    return await _cartRepository.getLoggedUserCart();
  }

  Future<ApiResult<List<AddressModel>>> getSavedAddresses() async {
    return await _addressRepository.getSavedAddresses();
  }
}