import 'package:flower_app/src/presentation/managers/profile/edit_profile_viewmodel/edit_profile_state.dart';
import 'package:flower_app/src/presentation/managers/profile/edit_profile_viewmodel/edit_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/spacing.dart';
import '../../widgets/profile/custom_app_bar_profile.dart';
import '../../widgets/profile/profile_image.dart';

class EditProfileBody extends StatelessWidget {
  final VoidCallback onBack;

  const EditProfileBody({
    super.key,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileViewModel, EditProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final _viewModel = context.read<EditProfileViewModel>();
        if (state is EditProfileLoading) {
          _viewModel.getUserData();
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is EditProfileLoaded) {
          return Column(
            children: [
              const CustomAppBarProfile(),
              Center(
                child: ProfileImage(
                  imageUrl: state.user?.photo,
                ),
              ),
              verticalSpace(8),
            ],
          );
        } else if (state is EditProfileError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
