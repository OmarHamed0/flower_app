import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/spacing.dart';

class AddressItemCard extends StatelessWidget {
  final String? address;
  final int value;
  final String? addressDetails;
  final int? groupValue;
  final ValueChanged<int?> onChanged;

  AddressItemCard(
      {super.key,
      required this.address,
      required this.value,
      required this.addressDetails,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CheckoutViewModel>();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                        activeColor: AppColors.kBaseColor,
                        value: value,
                        groupValue: groupValue,
                        onChanged: onChanged),
                    Text(
                      address!,
                      style: AppTextStyles.font16WeightMedium,
                    ),
                  ],
                ),
                verticalSpace(16),
                Text(
                  addressDetails!,
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
