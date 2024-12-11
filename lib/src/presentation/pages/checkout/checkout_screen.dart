import 'package:flower_app/common/common.dart';
import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/flower_app.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_actions.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_states.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_view_model.dart';
import 'package:flower_app/src/presentation/pages/checkout/checkout_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final viewModel = getIt.get<CheckoutViewModel>();
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CheckoutViewModel>().doAction(GetUserSavedAddressAction());
    });
  }
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
                  title: Text(AppLocalizations.of(context)!.checkout,
                    style: AppTextStyles.font20WeightMedium,)
              ),
              body: BlocBuilder<CheckoutViewModel, CheckOutStates>(
                builder: (context, state) {
                  return const CheckoutScreenBody();
                },
              ),
            );
          }, listener: ( context,  state)async {
            if(state is AddNewAddressState){
              final result = navKey.currentState!.pushNamed(PageRouteName.addAddress);
              if(result == true){
                 viewModel.doAction(GetUserSavedAddressAction());
              }
            }
        },
        )
    );
  }
}
