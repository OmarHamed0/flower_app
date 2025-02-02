import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/core/animations/app_animation.dart';
import 'package:flower_app/src/presentation/managers/tracking_order/tracking_order_actions.dart';
import 'package:flower_app/src/presentation/managers/tracking_order/tracking_order_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/common.dart';

class TrackingOrder extends StatelessWidget {
  const TrackingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final _viewModel = context.read<TrackingOrderViewModel>();
    return Column();
  }
}
