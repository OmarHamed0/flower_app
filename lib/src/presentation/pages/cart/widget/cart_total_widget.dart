import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/fonts/app_fonts.dart';
import 'package:flower_app/src/presentation/managers/cart/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartTotalWidget extends StatelessWidget {
  const CartTotalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var local=AppLocalizations.of(context)!;
    var cartViewModel = context.read<CartViewModel>();
    return BlocBuilder<CartViewModel, CartState>(
      builder: (context, state) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
              local.subTotal,
                style: AppFonts.font14Gray400Weight70,
              ),
              Text("${cartViewModel.totalPrice ?? 0}\$",
                  style: AppFonts.font14Gray400Weight70),
            ],
          ),
          verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(local.deliveryFee, style: AppFonts.font14Gray400Weight70),
              Text("10\$", style: AppFonts.font14Gray400Weight70),
            ],
          ),
          verticalSpace(16),
          const Divider(
            height: 2,
          ),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(local.total.toString(), style: AppFonts.font18Black500Weight),
              Text("${cartViewModel.totalPrice +10 }\$", style: AppFonts.font18Black500Weight),
            ],
          ),
        ],
      ),
    );
  }
}
