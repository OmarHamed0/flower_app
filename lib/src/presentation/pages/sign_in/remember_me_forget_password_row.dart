import 'package:flower_app/src/presentation/managers/sign_in/sign_in_actions.dart';
import 'package:flower_app/src/presentation/managers/sign_in/sign_in_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/styles/texts/app_text_styles.dart';
import '../../managers/sign_in/sign_in_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RememberMeForgetPasswordRow extends StatelessWidget {
  const RememberMeForgetPasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    final signInViewModel = context.read<SignInViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            BlocBuilder<SignInViewModel,SignInStates>(
              builder: (context,state){
                if(state is CheckBoxState){
                }
                return Checkbox(
                  value: signInViewModel.isBoxChecked,
                  onChanged: (value) {
                    signInViewModel.doAction(ChangeCheckBoxAction());
                  },
                );
              },
            ),
            Text(
              AppLocalizations.of(context)!.rememberMe,
              style: AppTextStyles.font13WeightNormal,
            )
          ],
        ),
        Text(
          AppLocalizations.of(context)!.forgetPassword,
          style: AppTextStyles.font13WeightNormal
              .copyWith(decoration: TextDecoration.underline),
        )
      ],
    );
  }
}
