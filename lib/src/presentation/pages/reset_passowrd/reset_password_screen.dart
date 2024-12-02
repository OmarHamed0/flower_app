import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flower_app/common/awesome_dialoge.dart';
import 'package:flower_app/common/common.dart';
import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/core/dialogs/app_dialogs.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/flower_app.dart';
import 'package:flower_app/src/presentation/managers/reset_password/reset_password_actions.dart';
import 'package:flower_app/src/presentation/managers/reset_password/reset_password_states.dart';
import 'package:flower_app/src/presentation/managers/reset_password/reset_password_view_model.dart';
import 'package:flower_app/src/presentation/pages/reset_passowrd/reset_password_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final viewModel = getIt.get<ResetPasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.kWhiteBase,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              AppLocalizations.of(context)!.resetPassword,
              style: AppTextStyles.font20WeightMedium,
            ),
          ),
          body: BlocListener<ResetPasswordViewModel, ResetPasswordStates>(
            listener: (context, state) {
              if(state is LoadingState){
                LoadingDialog.show(context);
              }
              if(state is PopLoadingDialogState){
                LoadingDialog.hide(context);
              }
              if (state is ErrorState) {
                showAwesomeDialog(context,
                    title: 'Error',
                    desc: state.message!,
                    onOk: () {
                     viewModel.doActin(LogoutAction());
                      navKey.currentState!.pushNamedAndRemoveUntil(
                          PageRouteName.signIn, (route) => false);
                    },
                    dialogType: DialogType.error);
              }
              else if(state is SuccessState){
                showAwesomeDialog(context,
                    title: 'Success',
                    desc: AppLocalizations.of(context)!.passwordChangedSuccessfully,
                    onOk: () {
                       Navigator.pop(context);
                    },
                    dialogType: DialogType.success);
              }
            },
            child: ResetPasswordScreenBody(),
          ),
        ),
      ),
    );
  }
}
