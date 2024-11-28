import 'package:flower_app/src/presentation/pages/profile/edit_profile_body.dart';
import 'package:flower_app/src/presentation/pages/profile/main_profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependency_injection/di.dart';
import '../../managers/profile/profile_screen_viewmodel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEditing = false;
  final ProfileScreenViewModel _viewModel = getIt<ProfileScreenViewModel>();

  void _toggleEditMode() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel..getUserData(),
      child: Scaffold(
        body: _isEditing
            ? EditProfileBody(onBack: _toggleEditMode)
            : MainProfileBody(onEdit: _toggleEditMode),
      ),
    );
  }
}
