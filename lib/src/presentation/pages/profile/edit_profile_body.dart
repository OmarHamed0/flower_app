import 'package:flower_app/src/domain/entities/auth/user_entity.dart';
import 'package:flutter/material.dart';

class EditProfileBody extends StatelessWidget {
  final VoidCallback onBack;
  final UserEntity user; // Add user parameter

  const EditProfileBody({super.key, required this.onBack, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
        const SizedBox(height: 16),
        // Display user information here
        Center(
          child: Text('Edit Profile Screen for ${user.firstName}'),
        ),
      ],
    );
  }
}
