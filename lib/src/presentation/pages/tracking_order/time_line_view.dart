import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../common/common.dart';
import '../../../../core/functions/spacing.dart';
import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/styles/texts/app_text_styles.dart';

class TimeLineView extends StatelessWidget {
  const TimeLineView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> timelineData = [
      {"title": "Received your order", "dateAndTime": "03 Sep 2024 - 2:10"},
      {"title": "Preparing your order", "dateAndTime": "03 Sep 2024 - 2:10"},
      {"title": "Out for delivery", "dateAndTime": "03 Sep 2024 - 2:10"},
      {"title": "Delivered", "dateAndTime": "03 Sep 2024 - 2:10"},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Prevent scrolling inside another scrollable view
      itemCount: timelineData.length,
      itemBuilder: (context, index) {
        final isFirst = index == 0;
        final isLast = index == timelineData.length - 1;

        return TimelineTile(
          alignment: TimelineAlign.start,
          lineXY: 0.1,
          isFirst: isFirst,
          isLast: isLast,
          indicatorStyle: IndicatorStyle(
            color: isFirst ? AppColors.kBaseColor : AppColors.kGray, // Pink for the first, grey for the rest
            width: 20.0,
            iconStyle: IconStyle(
              iconData: Icons.circle,
              color: isFirst ? AppColors.kBaseColor : AppColors.kGray,
            ),
          ),
          beforeLineStyle: const LineStyle(
            color: AppColors.kGray,
            thickness: 2.0,
          ),
          afterLineStyle: const LineStyle(
            color: AppColors.kGray,
            thickness: 2.0,
          ),
          endChild: _timeLineChild(
            title: timelineData[index]["title"]!,
            dateAndTime: timelineData[index]["dateAndTime"]!,
          ),
        );
      },
    );
  }

  Widget _timeLineChild({required String title, required String dateAndTime}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.font14BlackBase400Weight,
          ),
          verticalSpace(4),
          Text(
            dateAndTime,
            style: AppTextStyles.font14Gray400Weight70,
          ),
        ],
      ),
    );
  }
}
