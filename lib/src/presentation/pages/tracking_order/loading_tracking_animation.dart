import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/common.dart';
import '../../../../core/animations/app_animation.dart';

class LoadingTrackingAnimation extends StatelessWidget {
  const LoadingTrackingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppAnimations.startTracking),
          verticalSpace(24),
          Text(
            context.localization.onMyWay,
            style: AppTextStyles.font24W500,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
