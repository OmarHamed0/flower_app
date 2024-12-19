import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/images/app_images.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import '../../../../common/common.dart';
import '../../../../core/styles/colors/app_colors.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8,bottom: 8),
      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      width: context.width,
      height: 130.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.kWhite70, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            AppImages.productDetailsTestImage,
            width: 100.w,
            height: 100.h,
          ),
          horizontalSpace(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "title",
                style: AppTextStyles.font12WeightNormal,
              ),
              verticalSpace(4),
              Text(
                "Egp 200",
                style: AppTextStyles.font16BlackBase400Weight,
              ),
              verticalSpace(4),
              Text(
                "order number or delire at",
                style: AppTextStyles.font12WeightNormal,
              ),
              verticalSpace(4),
              SizedBox(
                width: context.width * 0.45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kBaseColor),
                  onPressed: () {},
                  child: Text(
                    "Reorder",
                    style: AppTextStyles.font13WeightNormal
                        .copyWith(color: AppColors.kWhiteBase),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
