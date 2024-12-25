import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flower_app/common/common.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import '../../../../../../common/awesome_dialoge.dart';
import '../../../../../../config/routes/page_route_name.dart';
import '../../../../../../core/dialogs/app_dialogs.dart';
import '../../../../managers/cart/cart_view_model.dart';

class HandleAddCartState {
  void handleBlocListenerAddCartState(BuildContext context, CartState state) {
    if (state is AddCartLoadingState) {
      LoadingDialog.show(context);
    } else if (state is AddCartSuccessState) {
      _hideLoading(context);
      _buildSuccessAddCartState(context);
    } else if (state is AddCartErrorState) {
      _hideLoading(context);
      print("state is ${state.exception}");
      _buildErrorAddCartState(context, state);
    }
  }

  void _buildSuccessAddCartState(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        AppLocalizations.of(context)!.cartAddedSuccessfully,
      ),
    ));
  }

  void _buildErrorAddCartState(BuildContext context, AddCartErrorState state) {
    final errorHandler=ErrorHandler.fromException(state.exception, AppLocalizations.of(context)!);
    if (  errorHandler.code == 401) {
      _buildUnauthorizedErrorWidget(context);
    } else {
      _buildErrorAddCartWidget(context, errorHandler.errorMassage);
    }
  }

  void _buildUnauthorizedErrorWidget(BuildContext context) {
    showAwesomeDialog(context,
        title: AppLocalizations.of(context)!.error,
        desc: AppLocalizations.of(context)!.unauthorizedAccessPleaseLogin,
        dialogType: DialogType.error,
        buttonText: AppLocalizations.of(context)!.pleaseEnterLogin,
        onOk: () => _goNextToLogin(context),
        onCancel: () => _hideLoading(context));
  }

  void _buildErrorAddCartWidget(BuildContext context, String errorMassage) {
    showAwesomeDialog(context,
        title: AppLocalizations.of(context)!.error,
        desc: errorMassage,
        dialogType: DialogType.error,
        onOk: () {});
  }

  void _goNextToLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      PageRouteName.signIn,
      (route) => false,
    );
  }

  void _hideLoading(BuildContext context) {
    LoadingDialog.hide(context);
  }
}
