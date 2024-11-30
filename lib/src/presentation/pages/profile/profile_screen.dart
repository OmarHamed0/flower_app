import 'package:flower_app/src/domain/entities/auth/user_entity.dart';
import 'package:flower_app/src/presentation/pages/profile/guest_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependency_injection/di.dart';
import '../../managers/profile/profile_screen_state.dart';
import '../../managers/profile/profile_screen_viewmodel.dart';
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
  UserEntity? _user;

  void _toggleEditMode(UserEntity? user) {
    setState(() {
      _isEditing = !_isEditing;
      if (user != null) {
        _user = user; // Update the user object when toggling to edit mode
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel..getUserData(),
      child: Scaffold(
        body: BlocBuilder<ProfileScreenViewModel, ProfileScreenState>(
          builder: (context, state) {
            if (state is ProfileScreenLoaded) {
              return _isEditing
                  ? EditProfileBody(
                      onBack: () => _toggleEditMode(null),
                      user: state.user!,
                    )
                  : MainProfileBody(
                      user: state.user,
                      onEdit: () => _toggleEditMode(state.user!),
                    );
            }
            if (state is ProfileGuestScreenLoadedState) {
              return GuestProfile(user: state.user);
            }
            // Handle other states as before
            if (state is ProfileScreenLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProfileScreenError) {
              return Center(
                child: Text(state.message),
              );
            }
            return Center(
              child: Text('Unexpected Error'),
            );
          },
        ),
      ),
    );
  }
}
