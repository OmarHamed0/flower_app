import 'package:flower_app/src/domain/entities/auth/user_entity.dart';
import 'package:flower_app/src/presentation/managers/profile/edit_profile_viewmodel/edit_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependency_injection/di.dart';
import '../../managers/profile/profile_viewmodel/profile_screen_viewmodel.dart';
import 'edit_profile_body.dart';
import 'main_profile_body.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEditing = false;
  final ProfileScreenViewModel _viewModel = getIt<ProfileScreenViewModel>();
  final EditProfileViewModel _editViewModel = getIt<EditProfileViewModel>();
  UserEntity? _user;

  void _toggleEditMode() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isEditing
        ? BlocProvider(
            create: (context) => _editViewModel,
            child: EditProfileBody(
              onBack: () => _toggleEditMode(),
            ),
          )
        : BlocProvider(
            create: (context) => _viewModel,
            child: MainProfileBody(
              onEdit: () => _toggleEditMode(),
            ),
          );
  }
}
