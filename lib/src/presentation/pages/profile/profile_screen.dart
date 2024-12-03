import 'package:flower_app/src/presentation/managers/profile/edit_profile_viewmodel/edit_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependency_injection/di.dart';
import '../../managers/profile/profile_viewmodel/profile_actions.dart';
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
  late final ProfileScreenViewModel _viewModel;
  late final EditProfileViewModel _editViewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<ProfileScreenViewModel>();
    _editViewModel = getIt<EditProfileViewModel>();
  }

  void _toggleEditMode() {
    setState(() {
      _isEditing = !_isEditing;
    });
    _viewModel.doAction(GetUserDataProfileAction());
  }

  @override
  Widget build(BuildContext context) {
    return _isEditing
        ? BlocProvider.value(
            value: _editViewModel,
            child: EditProfileBody(
              onBack: _toggleEditMode,
            ),
          )
        : BlocProvider.value(
            value: _viewModel,
            child: MainProfileBody(
              onEdit: _toggleEditMode,
            ),
          );
  }
}
