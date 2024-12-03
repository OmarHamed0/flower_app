import 'package:flower_app/src/domain/entities/cart/cart_entity.dart';
import 'package:flower_app/src/domain/repositories/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/api_result.dart';

@injectable
class GetLoggedUserCartUseCase {
  final CartRepo cartRepository;
  GetLoggedUserCartUseCase(this.cartRepository);

  Future<ApiResult<CartEntity>> invoke() {
    return cartRepository.getLoggedUserCart();
  }
}
