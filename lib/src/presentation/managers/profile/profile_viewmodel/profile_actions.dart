import 'dart:io';

sealed class ProfileAction {
  const ProfileAction();
}

class GetUserDataProfileAction extends ProfileAction {
  const GetUserDataProfileAction();
}

class LogOutProfileAction extends ProfileAction {
  const LogOutProfileAction();
}
