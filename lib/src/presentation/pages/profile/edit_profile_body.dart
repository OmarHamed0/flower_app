import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flower_app/common/awesome_dialoge.dart';
import 'package:flower_app/config/helpers/me/validations.dart';
import 'package:flower_app/core/widgets/app_button.dart';
import 'package:flower_app/src/presentation/managers/profile/edit_profile_viewmodel/edit_profile_state.dart';
import 'package:flower_app/src/presentation/managers/profile/edit_profile_viewmodel/edit_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dialogs/app_dialogs.dart';
import '../../../../core/functions/spacing.dart';
import '../../../../core/widgets/custom_auth_text_feild.dart';
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
            title: 'Success',
            desc: 'Profile updated Successfully',
            onOk: () async {
              onBack(); // Navigate back
            },
            dialogType: DialogType.success,
          );
        } else if (state is EditProfileError) {
          showAwesomeDialog(context,
              title: 'Error',
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
                  CustomAppBarEditProfile(),
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
                          hintText: 'Enter your first name',
                          labelText: 'First name',
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
                          hintText: 'Enter your last name',
                          labelText: 'Last name',
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
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    controller: _viewModel.emailController,
                    labelText: 'Email Address',
                    validator: (val) {
                      return validateEmail(val);
                    },
                  ),
                  verticalSpace(24),
                  CustomTextFormField(
                    hintText: 'Enter your phone number',
                    keyboardType: TextInputType.phone,
                    controller: _viewModel.phoneController,
                    labelText: 'Phone Number',
                    validator: (val) {
                      if (val!.length < 10 && val.isNotEmpty) {
                        {
                          return 'Phone number must be at least 10 characters';
                        }
                      }
                      return null;
                    },
                  ),
                  verticalSpace(24),
                  CustomTextFormField(
                    changePasswordTap: () {},
                    isPasswordVisible: false,
                    // showPassword: () {},
                    hintText: 'Enter your password',
                    keyboardType: TextInputType.visiblePassword,
                    controller: TextEditingController(),
                    labelText: 'Password',
                    validator: (val) {
                      return validatePassword(val);
                    },
                  ),
                  verticalSpace(24),
                  // GenderSelection(
                  //   selectedGender: state.user!.gender,
                  // ),
                  verticalSpace(24),
                  AppButton(
                      text: 'Update',
                      onPressed: () {
                        _viewModel.editProfile();
                      }),
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
