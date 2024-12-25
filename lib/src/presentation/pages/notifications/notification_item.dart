import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/src/domain/entities/notifications/notifications_entity.dart';
import 'package:flower_app/src/presentation/managers/notifications/notifications_screen_actions.dart';
import 'package:flower_app/src/presentation/managers/notifications/notifications_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotificationItem extends StatefulWidget {
  final int index;
  const NotificationItem({super.key,required this.index});

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<NotificationsViewModel>();
    final NotificationEntity notification = viewModel.notificationsList[widget.index];
    return Slidable(
      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
           backgroundColor: AppColors.error,
           icon: Icons.delete,
           label: "Delete",
           onPressed: (context){
             viewModel.doAction(DeleteNotificationAction(index: widget.index));
           }
        )
      ]),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Icon(
                      Icons.notifications_outlined, color: AppColors.kBlack),
                ),
                horizontalSpace(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            notification.title!,
                            style: AppTextStyles.font16WeightMedium,
                          ),
                        ],
                      ),
                      verticalSpace(8),
                      Text(
                          notification.body!,
                          style: AppTextStyles.font14BlackBase500Weight
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: AppColors.kWhite70,
          )
        ],
      ),
    );
  }
}
