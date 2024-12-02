import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flower_app/common/awesome_dialoge.dart';
import 'package:flower_app/common/common.dart';
import 'package:flower_app/config/helpers/me/validations.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/src/presentation/managers/profile/edit_profile_viewmodel/edit_profile_state.dart';
import 'package:flower_app/src/presentation/managers/profile/edit_profile_viewmodel/edit_profile_viewmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dialogs/app_dialogs.dart';
import '../../../../core/functions/spacing.dart';
import '../../../../core/widgets/custom_auth_text_feild.dart';
import '../../auth/signup/widgets/gender_selection.dart';
import '../../widgets/app_text_button.dart';
import '../../widgets/profile/custom_app_bar_edit_profile.dart';
import '../../widgets/profile/profile_image.dart';

class EditProfileBody extends StatelessWidget {
  final VoidCallback onBack;

  const EditProfileBody({
    super.key,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileViewModel, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileLoadingState) {
          LoadingDialog.show(context);
        } else if (state is EditProfileSuccessState) {
          LoadingDialog.hide(context);
          context.read<EditProfileViewModel>().getUserData();
          showAwesomeDialog(
            context,
            title: AppLocalizations.of(context)!.success,
            desc: AppLocalizations.of(context)!.profileUpdated,
            onOk: () async {
              onBack(); // Navigate back
            },
            dialogType: DialogType.success,
          );
        } else if (state is EditProfileError) {
          showAwesomeDialog(context,
              title: AppLocalizations.of(context)!.error,
              desc: state.message,
              onOk: () {},
              dialogType: DialogType.error);
        }
      },
      builder: (context, state) {
        final _viewModel = context.read<EditProfileViewModel>();

        if (state is EditProfileLoading) {
          _viewModel.getUserData();
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is EditProfileLoaded) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CustomAppBarEditProfile(
                    onBack: onBack,
                  ),
                  verticalSpace(8),
                  Center(
                    child: ProfileImage(
                      imageUrl: state.user?.photo,
                      isEditable: true,
                    ),
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          hintText:
                              AppLocalizations.of(context)!.enterYourFirstName,
                          labelText: AppLocalizations.of(context)!.firstName,
                          controller: _viewModel.firstNameController,
                          validator: (val) {
                            return validateName(val);
                          },
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      horizontalSpace(16),
                      Expanded(
                        child: CustomTextFormField(
                          hintText:
                              AppLocalizations.of(context)!.enterYourLastName,
                          labelText: AppLocalizations.of(context)!.lastName,
                          controller: _viewModel.lastNameController,
                          validator: (val) {
                            return validateName(val);
                          },
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(24),
                  CustomTextFormField(
                    hintText: AppLocalizations.of(context)!.enterYourEmail,
                    keyboardType: TextInputType.emailAddress,
                    controller: _viewModel.emailController,
                    labelText: AppLocalizations.of(context)!.email,
                    validator: (val) {
                      return validateEmail(val);
                    },
                  ),
                  verticalSpace(24),
                  CustomTextFormField(
                    hintText: AppLocalizations.of(context)!.enterYourPhone,
                    keyboardType: TextInputType.phone,
                    controller: _viewModel.phoneController,
                    labelText: AppLocalizations.of(context)!.phone,
                    validator: (val) {
                      if (val!.length < 10 && val.isNotEmpty) {
                        {
                          return AppLocalizations.of(context)!.phoneError;
                        }
                      }
                      return null;
                    },
                  ),
                  verticalSpace(24),
                  GenderSelection(
                    selectedGender: state.user!.gender,
                  ),
                  verticalSpace(24),
                  AppTextButton(
                    buttonText: AppLocalizations.of(context)!.update,
                    onPressed: () {
                      _viewModel.editProfile();
                    },
                    textStyle: AppTextStyles.font16WeightMedium.copyWith(
                      color: AppColors.kWhiteBase,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ],
              ),
            ),
          );
        } else if (state is EditProfileError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
