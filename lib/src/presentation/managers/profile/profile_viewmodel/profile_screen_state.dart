import 'package:flower_app/src/domain/entities/auth/user_entity.dart';

sealed class ProfileScreenState {
  const ProfileScreenState();
}

class ProfileScreenInitial extends ProfileScreenState {
  const ProfileScreenInitial();
}

class ProfileScreenLoading extends ProfileScreenState {
  const ProfileScreenLoading();
}

class ProfileScreenLoaded extends ProfileScreenState {
  final UserEntity? user;
  const ProfileScreenLoaded({
    required this.user,
  });
}

class ProfileGuestScreenLoadedState extends ProfileScreenState {
  final UserEntity? user;

  const ProfileGuestScreenLoadedState({this.user});
}

class ProfileScreenLogout extends ProfileScreenState {
  const ProfileScreenLogout();
}

class PopUpDialog extends ProfileScreenState {
  final String message;
  const PopUpDialog(
    this.message,
  );
}

class ProfileScreenError extends ProfileScreenState {
  final Exception exception;
  const ProfileScreenError(
    this.exception,
  );
}


