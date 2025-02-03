import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/core/animations/app_animation.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/src/presentation/managers/tracking_order/tracking_order_actions.dart';
import 'package:flower_app/src/presentation/managers/tracking_order/tracking_order_states.dart';
import 'package:flower_app/src/presentation/managers/tracking_order/tracking_order_view_model.dart';
import 'package:flower_app/src/presentation/pages/tracking_order/thanks_page.dart';
import 'package:flower_app/src/presentation/pages/tracking_order/tracking_order_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../common/common.dart';
import '../../../../dependency_injection/di.dart';
import 'loading_tracking_animation.dart';

class TrackingOrderPage extends StatelessWidget {
  TrackingOrderPage({super.key});

  final viewModel = getIt<TrackingOrderViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: Scaffold(
        backgroundColor: AppColors.kWhiteBase,
        appBar: AppBar(
          title: Text(
            context.localization.trackOrder,
            style: AppTextStyles.font20WeightMedium,
          ),
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: BlocConsumer<TrackingOrderViewModel, TrackingOrderStates>(
          builder: (context, state) {
            if (state is StartTrackingOrderState) {
              Future.delayed(const Duration(seconds: 5), (){
                viewModel.doAction(GoToTrackingOrderPageAction());
              });
              return const LoadingTrackingAnimation();
            }
            if(state is  GoToTrackingOrderPageState){
              return const TrackingOrderView();
            }
            return const ThanksPage();
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
