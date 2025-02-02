import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/src/presentation/managers/tracking_order/tracking_order_states.dart';
import 'package:flower_app/src/presentation/managers/tracking_order/tracking_order_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/common.dart';
import '../../../../core/animations/app_animation.dart';
import '../../managers/tracking_order/tracking_order_actions.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({super.key});



  @override
  Widget build(BuildContext context) {
    final _viewModel = context.read<TrackingOrderViewModel>();
    Widget startTracking = const SizedBox.shrink();
    return BlocListener<TrackingOrderViewModel,TrackingOrderStates>(
      listener: (context,state) {
        if(state is StartTrackingOrderState){
          startTracking = Lottie.asset(AppAnimations.startTracking);
        }
      },
      child: Column(
        children: [
          Lottie.asset(AppAnimations.success),
          Text(context.localization.placeOrder),
          ElevatedButton(
            onPressed: () {
              _viewModel.doAction(StartTrackingOrderAction());
            },
            child: Text(context.localization.placeOrder),
          ),
          startTracking
        ],
      ),
    );
  }
}
