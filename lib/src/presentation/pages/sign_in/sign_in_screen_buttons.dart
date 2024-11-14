import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/styles/texts/app_text_styles.dart';
import '../../managers/sign_in/sign_in_actions.dart';
import '../../managers/sign_in/sign_in_view_model.dart';
import '../../widgets/app_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInScreenButtons extends StatelessWidget {
  const SignInScreenButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final signInViewModel = context.read<SignInViewModel>();
    return Column(
      children: [
        AppButton(
          label: AppLocalizations.of(context)!.login,
          labelStyle: AppTextStyles.font16WeightMedium
              .copyWith(color: AppColors.kWhiteBase),
          backgroundColor: AppColors.kBaseColor,
          onPressed: () {
            signInViewModel.doAction(SignInClickAction());
          },
        ),
        SizedBox(
          height: 16.h,
        ),
        AppButton(
          label: AppLocalizations.of(context)!.continueAsGuest,
          labelStyle: AppTextStyles.font16WeightMedium
              .copyWith(color: AppColors.kGray),
          onPressed: () {},
          backgroundColor: AppColors.kWhiteBase,
          borderColor: AppColors.kBlack,
        ),
      ],
    );
  }
}
