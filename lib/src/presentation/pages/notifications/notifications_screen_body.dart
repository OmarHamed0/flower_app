import 'package:flower_app/src/presentation/managers/notifications/notifications_screen_states.dart';
import 'package:flower_app/src/presentation/managers/notifications/notifications_view_model.dart';
import 'package:flower_app/src/presentation/pages/notifications/notification_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/common.dart';
import '../../../domain/entities/notifications/notifications_entity.dart';

class NotificationsScreenBody extends StatelessWidget {
  const NotificationsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<NotificationsViewModel>();
    return BlocBuilder<NotificationsViewModel, NotificationsScreenStates>(
      builder: (context, state) {
        if (viewModel.notificationsList.isEmpty) {
          return _emptyNotificationsList();
        }
        return _showNotificationsList(viewModel.notificationsList);
      },
    );
  }

  Widget _emptyNotificationsList() {
    return const Center(child: Text("No notifications yet"));
  }

  Widget _showNotificationsList(List<NotificationEntity> notificationsList) {
    return ListView.builder(
      itemCount: notificationsList.length,
      itemBuilder: (context, index) {
        return NotificationItem(notification: notificationsList[index]);
      },
    );
  }
}
