import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/notifications/notifications_screen_actions.dart';
import 'package:flower_app/src/presentation/managers/notifications/notifications_screen_states.dart';
import 'package:flower_app/src/presentation/managers/notifications/notifications_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsScreen extends StatelessWidget {
   NotificationsScreen({super.key});

  final notificationsViewModel = getIt<NotificationsViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context){
          notificationsViewModel.doAction(GoToNotificationDetailsAction());
          return notificationsViewModel;
        },
      child: SafeArea(child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('Notifications', style: AppTextStyles.font20WeightMedium,),
        ),
        body: BlocBuilder<NotificationsViewModel, NotificationsScreenStates>(
          builder: (context, state) {
              return SizedBox();
          }
        ),
      )),
    );
  }
}
