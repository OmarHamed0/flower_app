import 'package:flower_app/common/awesome_dialoge.dart';
import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:flower_app/src/presentation/auth/signup/manager/signup_states.dart';
import 'package:flower_app/src/presentation/auth/signup/manager/signup_viewmodel.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpModelViewListener extends StatelessWidget {
  const SignUpModelViewListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpViewModel, SignupViewState>(
      listener: (context, state) {
        if (state is SignupLoadingState) {
        const  CircularProgressIndicator();
        } else if (state is SignupSuccessState) {
          showAwesomeDialog(
            context,
            title: "Success",
            desc: "Your account has been created successfully!",
            dialogType: DialogType.success,
            onOk: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                PageRouteName.splash,
                    (route) => false,
              );
            },
          );
        } else if (state is SignupErrorState) {

          showAwesomeDialog(
            context,
            title: "Error",
            desc: state.message,
            dialogType: DialogType.error,
            onOk: () {},
          );
        } else if (state is PopDialogState) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return const SizedBox.shrink();
      },
    );
  }
}
