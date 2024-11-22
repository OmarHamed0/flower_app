import 'package:carousel_slider/carousel_slider.dart';
import 'package:flower_app/config/routes/app_route.dart';
import 'package:flower_app/core/styles/app_radius.dart';
import 'package:flower_app/src/presentation/managers/product_details/product_details_view_model.dart';
import 'package:flower_app/src/presentation/pages/product_details/images_slider.dart';
import 'package:flutter/material.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/images/app_images.dart';
import 'package:flower_app/core/styles/spaceing.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/src/presentation/pages/product_details/product_price_and_statue_row.dart';
import 'package:flower_app/src/presentation/widgets/app_text_button.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ProductDetailsViewModel>();
    final productEntity = viewModel.productEntity;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 400.h,
            leading: const Icon(Icons.arrow_back_ios_new),
            backgroundColor: AppColors.kLightBink,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                double top = constraints.biggest.height;
                bool isCollapsed =
                    top <= kToolbarHeight + MediaQuery.of(context).padding.top;
                return FlexibleSpaceBar(
                  title: isCollapsed
                      ? Text(
                          productEntity?.title ?? "",
                          style: AppTextStyles.font20WeightBold,
                        )
                      : null,
                  background: const ImagesSlider(),
                  centerTitle: true,
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(16),
                  const ProductPriceAndStatueRow(),
                  verticalSpace(4),
                  Text(
                    "All prices include Tax",
                    style: AppTextStyles.font13WeightNormal
                        .copyWith(color: AppColors.kGray),
                  ),
                  verticalSpace(4),
                  Text(
                    productEntity?.title ?? "",
                    style: AppTextStyles.font16WeightMedium,
                  ),
                  verticalSpace(24),
                  Text(
                    "Description",
                    style: AppTextStyles.font16WeightMedium,
                  ),
                  verticalSpace(8),
                  Text(
                    productEntity?.description ?? "",
                    style: AppTextStyles.font14WeightNormal
                        .copyWith(color: AppColors.kBlack),
                  ),
                  verticalSpace(24),
                  Text("Bouquet include",
                      style: AppTextStyles.font16WeightMedium),
                  verticalSpace(8),
                  Text(
                    "pink roses: 15",
                    style: AppTextStyles.font14WeightNormal
                        .copyWith(color: AppColors.kBlack),
                  ),
                  verticalSpace(4),
                  Text(
                    "White wrap",
                    style: AppTextStyles.font14WeightNormal
                        .copyWith(color: AppColors.kBlack),
                  ),
                  verticalSpace(24),
                  FadeInUp(
                    child: AppTextButton(
                      borderRadius: AppBorderRadius.xxl,
                      buttonText: "Add to cart",
                      textStyle: AppTextStyles.font16WeightMedium
                          .copyWith(color: AppColors.kWhiteBase),
                      onPressed: () {},
                    ),
                  ),
                  verticalSpace(45)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
