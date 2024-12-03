import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/flower_app.dart';
import 'package:flower_app/src/domain/entities/product_entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/functions/spacing.dart';
import '../../../../../core/styles/fonts/app_fonts.dart';
import '../../../../../core/widgets/cached_network_image _widget.dart';
import '../../product_details/product_details.dart';
import 'add_to_cart_button_widget.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductItemWidget({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Color(0xFFA6A6A6))),
      padding: EdgeInsets.all(8.r),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              navKey.currentState!.push(
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetails(productId: productEntity.id ?? ""),
                ),
              );
            },
            child: Column(
              children: [
                _buildProductImage(),
                SizedBox(height: 8.h),
                _buildProductDetails(),
              ],
            ),
          ),
          SizedBox(height: 8.h),
           AddToCartButtonWidget(productId:  productEntity.id  ?? "",)
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      color: const Color(0xFFF9ECF0),
      height: 131.h,
      width: 174.w,
      alignment: Alignment.center,
      child: CachedNetworkImageWidget(
        imageUrl: productEntity.imageCover ?? '',
        height: 126,
        width: 92,
      ),
    );
  }

  Widget _buildProductDetails() {
    return Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(productEntity.title.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppFonts.font12BlackBase400Weight),
            verticalSpace(4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 5,
                  child: Row(
                    children: [
                      Text("EGP\t ", style: AppFonts.font14BlackBase500Weight),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                            productEntity.price.toString(),
                            style: AppFonts.font14BlackBase500Weight,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Flexible(
                  flex: 2,
                  child: Text(
                      (productEntity.price! /
                              ~productEntity.priceAfterDiscount!)
                          .toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppFonts.font12Gray400Weight.copyWith(
                        decoration: TextDecoration.lineThrough,
                      )),
                ),
                SizedBox(width: 8.w),
                Flexible(
                  flex: 2,
                  child: Text(productEntity.priceAfterDiscount.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppFonts.font12BlackBase400Weight
                          .copyWith(color: AppColors.kSuccess)),
                ),
                Flexible(
                  flex: 2,
                  child: Text("%",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppFonts.font12BlackBase400Weight
                          .copyWith(color: AppColors.kSuccess)),
                ),
              ],
            ),
          ],
        ));
  }
}
