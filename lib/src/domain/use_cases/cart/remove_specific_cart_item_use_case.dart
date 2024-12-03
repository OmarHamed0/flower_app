import 'package:flower_app/src/domain/repositories/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/api_result.dart';
import '../../entities/cart/cart_entity.dart';

@injectable
class RemoveSpecificCartItemUseCase {
  final CartRepo cartRepository;
  RemoveSpecificCartItemUseCase({required this.cartRepository});

  Future<ApiResult<CartEntity>> invoke({required String id}) {
    return cartRepository.removeSpecificCartItem(id: id);
  }
}
