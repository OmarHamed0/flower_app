import 'package:flower_app/core/styles/fonts/app_fonts.dart';
import 'package:flower_app/src/domain/entities/cart/cart_product_entity.dart';
import 'package:flower_app/src/presentation/managers/cart/cart_action.dart';
import 'package:flower_app/src/presentation/managers/cart/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/functions/spacing.dart';
import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../core/styles/images/app_images.dart';
import '../../../../../core/widgets/cached_network_image _widget.dart';

class CartItemWidget extends StatelessWidget {
  final CartProductEntity cartProductEntity;
  final int index;

  const CartItemWidget(
      {super.key, required this.cartProductEntity, required this.index});

  @override
  Widget build(BuildContext context) {
    var cartViewModel = context.read<CartViewModel>();
    return BlocBuilder<CartViewModel, CartState>(
      builder: (context, state) => Container(
        padding: EdgeInsets.all(10.0.r),
        margin: EdgeInsets.all(1.0.r),
        height: 117.h,
        width: 343.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: const Color(0xFF535353), width: 0.3.w)),
        child: Row(
          children: [
            _buildProductImage(cartProductEntity.imgCover ?? ""),
            horizontalSpace(8),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                cartProductEntity.title.toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.kBlackBase),
                              ),
                              verticalSpace(
                                4.h,
                              ),
                              Text(
                                cartProductEntity.description.toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.kGray),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            cartViewModel.doAction(RemoveSpecificCartItemAction(
                                cartProductEntity: cartProductEntity));
                          },
                          child: Image.asset(
                            AppImages.deleteIcon,
                            width: 24.w,
                            height: 24.h,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text("EGP ${cartProductEntity.price}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: AppFonts.font14BlackBase600Weight),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            cartViewModel.doAction(
                                DecrementQuantityCartItemAction(
                                    cartProductEntity: cartProductEntity));
                          },
                          child: const Icon(
                            Icons.remove,
                            color: AppColors.kBlackBase,
                          )),
                      SizedBox(
                        width: 7.w,
                      ),
                      Text(
                        cartProductEntity.counterQuantity.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppFonts.font14BlackBase600Weight,
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      InkWell(
                        onTap: () {
                          cartViewModel.doAction(
                              IncrementQuantityCartItemAction(
                                  cartProductEntity: cartProductEntity));
                        },
                        child: const Icon(
                          Icons.add,
                          color: AppColors.kBlackBase,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(String imageUrl) {
    return Container(
      height: 101.h,
      width: 96.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: const Color(0xFFF9ECF0),
      ),
      alignment: Alignment.center,
      child: CachedNetworkImageWidget(
        imageUrl: imageUrl,
        height: 87.h,
        width: 66.w,
      ),
    );
  }
}
