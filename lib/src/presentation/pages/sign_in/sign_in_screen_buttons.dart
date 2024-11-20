import 'package:flower_app/core/styles/app_radius.dart';
import 'package:flower_app/core/styles/spaceing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/styles/texts/app_text_styles.dart';
import '../../managers/sign_in/sign_in_actions.dart';
import '../../managers/sign_in/sign_in_view_model.dart';
import '../../widgets/app_text_button.dart';

class SignInScreenButtons extends StatelessWidget {
  const SignInScreenButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final signInViewModel = context.read<SignInViewModel>();
    return Column(
      children: [
        AppTextButton(
          borderRadius: AppBorderRadius.xxl,
          buttonText: AppLocalizations.of(context)!.login,
          textStyle: AppTextStyles.font16WeightMedium
              .copyWith(color: AppColors.kWhiteBase),
          backgroundColor: AppColors.kBaseColor,
          onPressed: () {
            signInViewModel.doAction(SignInClickAction());
          },
        ),
        verticalSpace(16),
        AppTextButton(
          borderRadius: AppBorderRadius.xxl,
          buttonText: AppLocalizations.of(context)!.continueAsGuest,
          textStyle:
              AppTextStyles.font16WeightMedium.copyWith(color: AppColors.kGray),
          onPressed: () {},
          backgroundColor: AppColors.kWhiteBase,
          borderColor: AppColors.kBlack,
        ),
      ],
    );
  }
}
