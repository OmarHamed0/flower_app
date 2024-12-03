import 'package:flower_app/common/common.dart';
import 'package:flower_app/src/presentation/managers/cart/cart_action.dart';
import 'package:flower_app/src/presentation/managers/cart/cart_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartButtonWidget extends StatelessWidget {
  final String productId;
  const AddToCartButtonWidget({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    var cartViewModel=context.read<CartViewModel>();
    return InkWell(
      onTap: ()=>cartViewModel.doAction(AddCartAction(
          productId: productId)),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 24.r),
        width: double.infinity,
        height: 40.h,
        decoration: BoxDecoration(
          color: const Color(0xFFD21E6A),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart_outlined,
                size: 15, color: Colors.white),
            SizedBox(width: 8.w),
            Text(
              "Add Cart",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}

