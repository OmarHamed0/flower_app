import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';

import '../../../../core/functions/spacing.dart';

class AddressItemCard extends StatelessWidget {
  const AddressItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
            padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                        value: 1,
                        groupValue: "address",
                        onChanged: (value) {}),
                    Text(
                      "Home",
                      style: AppTextStyles.font16WeightMedium,
                    ),
                  ],
                ),
                verticalSpace(16),
                Text(
                  "2XVP+XC - Sheikh Zayed",
                  style: AppTextStyles.font13WeightNormal,
                )
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
