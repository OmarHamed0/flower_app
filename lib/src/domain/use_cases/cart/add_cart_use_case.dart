import 'package:flower_app/src/data/api/core/requestes_models/cart/add_cart_request.dart';
import 'package:flower_app/src/domain/repositories/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/api_result.dart';
import '../../entities/cart/cart_entity.dart';

@injectable
class AddCartUseCase {
  final CartRepo cartRepo;
  AddCartUseCase({required this.cartRepo});
  Future<ApiResult<CartEntity>> invoke(
      {required AddCartRequest addCartRequest}) async {
    return await cartRepo.addCart(addCartRequest: addCartRequest);
  }
}
