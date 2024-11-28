import 'package:flower_app/core/styles/icons/app_icons.dart';
import 'package:flower_app/core/styles/images/app_images.dart';
import 'package:flower_app/src/presentation/managers/profile/profile_screen_state.dart';
import 'package:flower_app/src/presentation/managers/profile/profile_screen_viewmodel.dart';
import 'package:flower_app/src/presentation/widgets/profile/custom_app_bar_profile.dart';
import 'package:flower_app/src/presentation/widgets/profile/name_and_email.dart';
import 'package:flower_app/src/presentation/widgets/profile/profile_row_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/profile/profile_image.dart';

class MainProfileBody extends StatelessWidget {
  final VoidCallback onEdit;

  MainProfileBody({super.key, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: BlocBuilder<ProfileScreenViewModel, ProfileScreenState>(
          builder: (context, state) {
            if (state is ProfileScreenLoading) {
              return Center(
                child: Lottie.asset(AppImages.loading),
              );
            }
            if (state is ProfileScreenError) {
              return Center(
                child: Text(state.message),
              );
            }

            if (state is ProfileScreenLoaded) {
              return Column(
                children: [
                  const CustomAppBarProfile(),
                  Center(
                      child: ProfileImage(
                    imageUrl: state.user!.photo,
                  )),
                  const SizedBox(height: 8),
                  NameAndEmail(
                      name: state.user!.firstName,
                      email: state.user!.email,
                      onEdit: onEdit),
                  const SizedBox(height: 32),
                  const ProfileRowItem(
                      title: 'My Orders', icon: AppIcons.orderIcon),
                  const SizedBox(height: 16),
                  const ProfileRowItem(
                      title: 'Saved Addresses', icon: AppIcons.locationIcon),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  const ProfileRowItem(title: 'Notification'),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  const ProfileRowItem(
                    title: 'Language',
                    icon: AppIcons.localeIcon,
                  ),
                  const SizedBox(height: 16),
                  const ProfileRowItem(title: 'About Us'),
                  const SizedBox(height: 16),
                  const ProfileRowItem(title: 'Terms & Conditions'),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  const ProfileRowItem(title: 'Logout'),
                  Spacer(),
                  const Text(
                    'v 6.3.0 - (446)',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
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
