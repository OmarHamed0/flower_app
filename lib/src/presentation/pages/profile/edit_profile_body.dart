import 'package:flutter/material.dart';

class EditProfileBody extends StatelessWidget {
  final VoidCallback onBack;

  const EditProfileBody({super.key, required this.onBack});

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
        const Center(
          child: Text('Edit Profile Screen'),
        ),
      ],
    );
  }
}
