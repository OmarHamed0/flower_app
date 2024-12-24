import 'package:flower_app/common/common.dart';
import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/app_radius.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/flower_app.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_actions.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_states.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_view_model.dart';
import 'package:flower_app/src/presentation/pages/checkout/checkout_screen_body.dart';
import 'package:flower_app/src/presentation/pages/thank_you.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  final viewModel = getIt.get<CheckoutViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) {
          viewModel.doAction(GetTotalPriceAction());
          viewModel.doAction(GetUserSavedAddressAction());
          return viewModel;
        },
        child: BlocConsumer<CheckoutViewModel, CheckOutStates>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColors.kWhiteBase,
              appBar: AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.checkout,
                    style: AppTextStyles.font20WeightMedium,
                  )),
              body: BlocBuilder<CheckoutViewModel, CheckOutStates>(
                builder: (context, state) {
                  return const CheckoutScreenBody();
                },
              ),
            );
          },
          listener: (context, state) async {
            if (state is AddNewAddressState) {
              final result = await navKey.currentState!
                  .pushNamed(PageRouteName.addAddress);
              if (result == true) {
                viewModel.doAction(GetUserSavedAddressAction());
              }
            }
            if (state is PlaceOrderLoadingState) {
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                   shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: AppRadius.s, topRight: AppRadius.s),
                   ),
                  content: Row(
                    children: [
                       const CircularProgressIndicator(color: AppColors.kBaseColor,),
                       horizontalSpace(8),
                      const Text("Processing your order"),
                    ],
                  ),
                ),
              );
            }
            if (state is PlaceOrderSuccessState) {
              Future.delayed(const Duration(seconds: 4),() async{
                await Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const ThankYou()));
              });
               ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: AppColors.kSuccess,
                  content: Text("Successfully placed your order"),
                ),
              );

            }
            if (state is PlaceOrderFailState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.kError,
                  content: Text(ErrorHandler
                      .fromException(
                      state.exception!, AppLocalizations.of(context)!)
                      .errorMassage),
                ),
              );
            }
          },
        ));
  }
}
