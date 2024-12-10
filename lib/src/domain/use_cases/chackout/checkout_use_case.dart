
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/cart/cart_entity.dart';
import 'package:flower_app/src/domain/repositories/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckoutUseCase{
  final CartRepo cartRepository;
  CheckoutUseCase(this.cartRepository);
  Future<ApiResult<CartEntity>> invoke() {
    return cartRepository.getLoggedUserCart();
  }
}