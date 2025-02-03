import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/images/app_images.dart';
import 'package:flower_app/src/presentation/managers/tracking_order/tracking_order_view_model.dart';
import 'package:flower_app/src/presentation/pages/tracking_order/time_line_view.dart';
import 'package:flower_app/src/presentation/pages/tracking_order/tracking_order_view_top_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/common.dart';
import '../../../../core/styles/texts/app_text_styles.dart';
import 'driver_data_row.dart';

class TrackingOrderView extends StatelessWidget {
  const TrackingOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final _viewModel = context.read<TrackingOrderViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TrackingOrderViewTopView(),
          verticalSpace(40),
          const DriverDataRow(),
          verticalSpace(40),
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(AppImages.carSvg),
          ),
          verticalSpace(40),
          const TimeLineView(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {},
            child: Text("show map", style: AppTextStyles.font18500Weight),
          ),
        ],
      ),
    );
  }
}
