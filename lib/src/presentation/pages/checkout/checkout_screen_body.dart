import 'package:flower_app/common/common.dart';
import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/src/presentation/widgets/app_text_button.dart';

class CheckoutScreenBody extends StatelessWidget {
  const CheckoutScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            verticalSpace(24),
            _deliveryTimeScheduleRow(context),
            verticalSpace(16),
            _arriveTimeRow(),
            verticalSpace(16),
            _deliveryAddress(context),
            verticalSpace(16),
            _paymentMethod(context),
          ],
        ),
      ),
    );
  }

  Widget _deliveryTimeScheduleRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.deliveryTime,
          style: AppTextStyles.font18BlackMedium,
        ),
        Text(
          AppLocalizations.of(context)!.schedule,
          style: AppTextStyles.font18BaseColorSemiBold,
        )
      ],
    );
  }

  Widget _arriveTimeRow() {
    return Row(
      children: [
        const Icon(
          Icons.access_time,
          color: AppColors.kBlackBase,
        ),
        horizontalSpace(4),
        Text(
          'Instant,',
          style: AppTextStyles.font14BlackBase400Weight,
        ),
        horizontalSpace(4),
        Text(
          "Arrive by 03 Sep 2024, 11:00 AM ",
          style: AppTextStyles.font14WeightNormal
              .copyWith(color: AppColors.kSuccess),
        )
      ],
    );
  }

  Widget _deliveryAddress(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivery address",
            style: AppTextStyles.font18BlackMedium,
          ),
          verticalSpace(16),
          Container(
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: AppColors.kWhiteBase,
              border: const Border.fromBorderSide(
                BorderSide(
                  color: AppColors.kWhiteBase,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kBlackBase.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 24,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Row(
                        children: [
                          Radio(
                              value: 1, groupValue: "address", onChanged:(value){}),
                          Text("Home",style: AppTextStyles.font16WeightMedium,),
                        ],
                      ),
                      verticalSpace(16),
                      Text("2XVP+XC - Sheikh Zayed",style: AppTextStyles.font13WeightNormal,)
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: () {},
                )
              ],
            ),
          ),
          verticalSpace(16),
          Container(
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: AppColors.kWhiteBase,
              border: const Border.fromBorderSide(
                BorderSide(
                  color: AppColors.kWhiteBase,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kBlackBase.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 24,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: 1, groupValue: "address", onChanged:(value){}),
                          Text("Home",style: AppTextStyles.font16WeightMedium,),
                        ],
                      ),
                      verticalSpace(16),
                      Text("2XVP+XC - Sheikh Zayed",style: AppTextStyles.font13WeightNormal,)
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: () {},
                )
              ],
            ),
          ),
          verticalSpace(16),
          AppTextButton(
            buttonText: "Add new",
            textStyle: AppTextStyles.font14WeightNormal
                .copyWith(color: AppColors.kBaseColor),
            onPressed: () {},
            borderRadius: BorderRadius.circular(100),
            backgroundColor: AppColors.kWhiteBase,
            borderColor: AppColors.kBlackBase,
          )
        ],
      ),
    );
  }

  Widget _paymentMethod(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Payment method",style: AppTextStyles.font18BlackMedium,),
          verticalSpace(16),
          Container(
            decoration: BoxDecoration(
              color: AppColors.kWhiteBase,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kBlackBase.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 24,
                )
              ],
            ),
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Cash on delivery", style: AppTextStyles.font16WeightMedium,),
                  Radio(value: 1, groupValue: "payment", onChanged: (value){})
                ],
              ),
            ),
          ),
          verticalSpace(16),
          Container(
            decoration: BoxDecoration(
              color: AppColors.kWhiteBase,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kBlackBase.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 24,
                )
              ],
            ),
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Credit card", style: AppTextStyles.font16WeightMedium,),
                  Radio(value: 1, groupValue: "payment", onChanged: (value){})
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
