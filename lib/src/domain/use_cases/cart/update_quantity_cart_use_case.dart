import 'package:flower_app/src/domain/repositories/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/api_result.dart';
import '../../../data/api/core/requestes_models/cart/cart_quantity_request.dart';
import '../../entities/cart/cart_entity.dart';

@injectable
class UpdateQuantityCartUseCase {
  final CartRepo cartRepository;
  UpdateQuantityCartUseCase(this.cartRepository);

  Future<ApiResult<CartEntity>> invoke(
      {required CartQuantityRequest cartQuantityRequest, required String id}) {
    return cartRepository.updateQuantityCart(
        id: id, cartQuantityRequest: cartQuantityRequest);
  }
}
