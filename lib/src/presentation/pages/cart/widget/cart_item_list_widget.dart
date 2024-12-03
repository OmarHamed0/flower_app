import 'package:flower_app/common/common.dart';
import 'package:flower_app/src/presentation/managers/cart/cart_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_item_widget.dart';

class CartItemListWidget extends StatelessWidget {
  const CartItemListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cartViewModel=context.read<CartViewModel>();
    return    BlocBuilder<CartViewModel,CartState>(
      builder: (context, state) => SizedBox(
        height: 350.h,
        width: double.infinity,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => CartItemWidget(
            cartProductEntity: cartViewModel.cartProduct[index],
            index: index,
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 24.h,
          ),
          itemCount:  cartViewModel.cartProduct.length,
        ),
      ),
    );
  }
}
