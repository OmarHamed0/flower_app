import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: SizedBox(
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(AppAnimations.success),
            verticalSpace(56),
            SizedBox(
              child: Text(context.localization.orderPlacedSuccessfully,
                  style: AppTextStyles.font24W500),
            ),
            verticalSpace(40),
            ElevatedButton(
              onPressed: () {
                _viewModel.doAction(StartTrackingOrderAction());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Align(
                  child: Text(
                    textAlign: TextAlign.center,
                    context.localization.trackOrder,
                    style: AppTextStyles.font14BlackBase500Weight
                        .copyWith(color: AppColors.kWhiteBase),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
