import 'package:flower_app/common/common.dart';
import 'package:flower_app/src/presentation/pages/cart/widget/cart_handler_widget/state_massage_widget.dart';
import '../../../../../../config/routes/page_route_name.dart';
import '../../../../../../core/styles/images/app_images.dart';
class CartHandlerWidget {
  static Widget buildCartEmpty(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StateMessageWidget(
          errorMassage:AppLocalizations.of(context)!.yourCartIsEmpty,
          text: AppLocalizations.of(context)!.addToCart,
          imageUrl: AppImages.cartEmpty,
          onPressed: () => _goNextBestSeller(context),
        ),
      ),
    );
  }
 static  Widget buildUnauthorizedWidget(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StateMessageWidget(
          errorMassage:AppLocalizations.of(context)!.unauthorizedAccessPleaseLogin,
          text: AppLocalizations.of(context)!.pleaseEnterLogin,
          imageUrl: AppImages.invalidToken,
          onPressed: () =>_goNextToLogin(context),
        ),
      ),
    );
  }
 static Widget buildErrorWidget(String errorMassage,{ void Function()? onPressed}) {
    return Scaffold(
      body: Center(
        child: StateMessageWidget(
          errorMassage: errorMassage,
          text: 'Please Try Again',
          imageUrl: AppImages.errorImage,
          onPressed: onPressed
        ),
      ),
    );
  }

 static void _goNextToLogin(BuildContext context){
    Navigator.of(context).pushNamed(PageRouteName.signIn);
  }

  static void _goNextBestSeller(BuildContext context){
    Navigator.of(context).pushNamed(PageRouteName.besetSellerScreen);
  }
}
