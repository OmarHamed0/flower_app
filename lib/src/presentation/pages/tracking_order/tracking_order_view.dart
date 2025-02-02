import 'package:flower_app/src/presentation/managers/tracking_order/tracking_order_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/common.dart';

class TrackingOrderView extends StatelessWidget {
  const TrackingOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final _viewModel = context.read<TrackingOrderViewModel>();
    return const Column(
      children: [
        Text("tracking")
      ],
    );
  }
}
