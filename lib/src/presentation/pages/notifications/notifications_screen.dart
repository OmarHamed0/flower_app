import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:flower_app/src/presentation/managers/notifications/notifications_screen_actions.dart';
import 'package:flower_app/src/presentation/managers/notifications/notifications_screen_states.dart';
import 'package:flower_app/src/presentation/managers/notifications/notifications_view_model.dart';
import 'package:flower_app/src/presentation/pages/notifications/notifications_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsScreen extends StatelessWidget {
   NotificationsScreen({super.key});

  final notificationsViewModel = getIt.get<NotificationsViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context){
          notificationsViewModel.doAction(GetAllNotificationsAction());
          return notificationsViewModel;
        },
      child: SafeArea(child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(AppLocalizations.of(context)!.notifications, style: AppTextStyles.font20WeightMedium,),
        ),
        body: BlocBuilder<NotificationsViewModel, NotificationsScreenStates>(
          builder: (context, state) {
              if(state is LoadingState) {
                   return const Center(child: CircularProgressIndicator());
              }
              if(state is LoadedState) {
                return const NotificationsScreenBody();
              }
              if(state is FailedState) {
                String errorMessage = ErrorHandler.fromException(state.exception!, AppLocalizations.of(context)!).errorMassage;
                return Center(child: Text(errorMessage ?? "Error"));
              }
              return const SizedBox();
          }
        ),
      )),
    );
  }
}
