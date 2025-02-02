import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/src/presentation/managers/tracking_order/tracking_order_states.dart';
import 'package:flower_app/src/presentation/managers/tracking_order/tracking_order_view_model.dart';
import 'package:flower_app/src/presentation/pages/tracking_order/thanks_page.dart';
import 'package:flower_app/src/presentation/pages/tracking_order/tracking_order.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/common.dart';
import '../../../../dependency_injection/di.dart';

class TrackingOrderPage extends StatelessWidget {
  TrackingOrderPage({super.key});

  final viewModel = getIt<TrackingOrderViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.localization.total),
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: BlocConsumer<TrackingOrderViewModel, TrackingOrderStates>(
          builder: (context, state) {
            if(state is StartTrackingOrderState){
              Future.delayed(const Duration(seconds: 5),(){
                return const TrackingOrder();
              });
            }
            return  const ThanksPage();
          },
          listener: (context, state) {

          },
        ),
      ),
    );
  }
}
