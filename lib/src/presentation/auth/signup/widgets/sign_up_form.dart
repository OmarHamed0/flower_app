import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/widgets/app_text_form_feild.dart';
import 'package:flower_app/src/presentation/auth/signup/manager/signup_viewmodel.dart';
import 'package:flower_app/src/presentation/auth/signup/widgets/gender_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/helpers/validations.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    final formKey = context.read<SignUpViewModel>().formKey;
    return Form(
        key: formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: AppTextFormField(
                    controller:
                        context.read<SignUpViewModel>().firstNameController,
                    labelText: 'First name',
                    hintText: 'Enter first name',
                    validator: validateName,
                  ),
                ),
                horizontalSpace(17),
                Expanded(
                  child: AppTextFormField(
                    controller:
                        context.read<SignUpViewModel>().lastNameController,
                    labelText: 'Last name',
                    hintText: 'Enter last name',
                    validator: validateName,
                  ),
                ),
              ],
            ),
            AppTextFormField(
              controller: context.read<SignUpViewModel>().emailController,
              labelText: 'Email',
              hintText: 'Enter your email',
              validator: validateEmail,
            ),
            Row(
              children: [
                Expanded(
                  child: AppTextFormField(
                    controller:
                        context.read<SignUpViewModel>().passwordController,
                    labelText: 'Password',
                    hintText: 'Enter password',
                    isObscureText: isObscureText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      child: Icon(
                        isObscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    validator: validatePassword,
                  ),
                ),
                horizontalSpace(17),
                Expanded(
                  child: AppTextFormField(
                    controller: context
                        .read<SignUpViewModel>()
                        .confirmPasswordController,
                    labelText: 'Confirm password',
                    hintText: 'Confirm password',
                    isObscureText: isObscureText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      child: Icon(
                        isObscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    validator: (value) => validateConfirmPassword(
                      context.read<SignUpViewModel>().passwordController.text,
                      value,
                    ),
                  ),
                ),
              ],
            ),
            AppTextFormField(
              controller: context.read<SignUpViewModel>().phoneController,
              labelText: 'Phone number',
              hintText: 'Enter phone number',
              validator: validatePhoneNumber,
            ),
            GenderSelection(),
          ],
        ));
  }
}
