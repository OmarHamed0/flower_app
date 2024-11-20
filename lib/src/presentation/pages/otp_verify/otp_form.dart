import 'package:flower_app/core/styles/app_radius.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/otp_verify/otp_verify_action.dart';
import 'package:flower_app/src/presentation/managers/otp_verify/otp_verify_view_model.dart';
import 'package:flower_app/src/presentation/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OtpForm extends StatelessWidget {
  late OtpVerifyViewModel viewModel;

  OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = getIt.get<OtpVerifyViewModel>();
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: viewModel.otpFormKey,
      child: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          Text(
              textAlign: TextAlign.center,
              AppLocalizations.of(context)!.emailVerification,
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(
            height: 16,
          ),
          Text(
            textAlign: TextAlign.center,
            AppLocalizations.of(context)!
                .pleaseEnterYourCodeThatSendToYourEmailAddress,
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 2,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(6, (index) {
              return Expanded(
                child: TextFormField(
                  controller: viewModel.controllers[index],
                  autofocus: index == 0,
                  // Autofocus the first field
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context)
                          .nextFocus(); // Move to the next field
                    } else if (value.isEmpty) {
                      FocusScope.of(context)
                          .previousFocus(); // Move to the previous field
                    }
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  decoration: const InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              );
            }),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.didNotReceiveCode,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.resend,
                  ))
            ],
          ),
          AppTextButton(
            borderRadius: AppBorderRadius.xxl,
            buttonText: AppLocalizations.of(context)!.confirm,
            textStyle: AppTextStyles.font16WeightMedium
                .copyWith(color: AppColors.kWhiteBase),
            onPressed: () => viewModel.doIntent(OnCompleteCodeVerifyAction()),
            backgroundColor: AppColors.kBaseColor,
            borderColor: AppColors.kBlack,
          ),
        ],
      ),
    );
  }
}
