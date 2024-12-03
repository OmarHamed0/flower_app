
import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/fonts/app_fonts.dart';
import 'package:flower_app/src/presentation/managers/cart/cart_view_model.dart';
import 'package:flower_app/src/presentation/pages/cart/widget/cart_item_list_widget.dart';
import 'package:flower_app/src/presentation/pages/cart/widget/check_out_button_widget.dart';
import 'package:flower_app/src/presentation/pages/cart/widget/delivery_Info_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/styles/spaceing.dart';
import 'cart_total_widget.dart';

class CartBodyWidget extends StatefulWidget {
  const CartBodyWidget({super.key});

  @override
  State<CartBodyWidget> createState() => _CartBodyWidgetState();
}

class _CartBodyWidgetState extends State<CartBodyWidget> {
  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<CartViewModel>();
    return BlocBuilder<CartViewModel, CartState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.kWhiteBase,
          appBar: AppBar(
            backgroundColor: AppColors.kWhiteBase,
            title: _titleAppBar(viewModel.cartProduct.length ?? 0),
          ),
          body: Padding(
            padding: EdgeInsets.only(bottom: 16.0.h, left: 16.w, right: 16.w),
            child: Column(
              children: [
                const DeliveryInfoWidget(),
                verticalSpace(
                  24,
                ),
                const Expanded(child: CartItemListWidget()),
                verticalSpace(
                  33,
                ),
                const CartTotalWidget(),
                verticalSpace(48),
                const CheckOutButtonWidget(),
                verticalSpace(10),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _titleAppBar(int length) {
    return Row(
      children: [
         Text(
         AppLocalizations.of(context)!.cart,
          style:
          AppFonts.font20Black500Weight
        ),
        Text(
          "($length ${AppLocalizations.of(context)!.items}) ",
          style: AppFonts.font20KGrayBase400Weight,
        ),
      ],
    );
  }
}
