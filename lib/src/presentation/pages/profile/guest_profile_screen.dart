import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/flower_app.dart';
import 'package:flower_app/src/domain/entities/auth/user_entity.dart';
import 'package:flower_app/src/presentation/widgets/profile/profile_image.dart';
import 'package:flower_app/src/presentation/widgets/profile/profile_row_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../config/routes/page_route_name.dart';
import '../../../../core/styles/icons/app_icons.dart';
import '../../widgets/profile/custom_app_bar_profile.dart';
import '../../widgets/profile/name_and_email.dart';

class GuestProfile extends StatelessWidget {
  const GuestProfile({super.key, required this.user});
  final UserEntity? user;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBarProfile(),
            const Center(
              child: ProfileImage(),
            ),
            verticalSpace(16),
            NameAndEmail(
              name: user?.firstName ?? 'Guest',
              email: user?.email ?? '',
            ),
            verticalSpace(16),
            const Divider(),
            verticalSpace(16),
            ProfileRowItem(title: AppLocalizations.of(context)!.notification),
            verticalSpace(16),
            const Divider(),
            verticalSpace(16),
            ProfileRowItem(
              title: AppLocalizations.of(context)!.language,
              icon: AppIcons.localeIcon,
            ),
            verticalSpace(16),
            ProfileRowItem(title: AppLocalizations.of(context)!.aboutUs),
            verticalSpace(16),
            ProfileRowItem(
                title: AppLocalizations.of(context)!.termsAndConditions),
            verticalSpace(16),
            const Divider(),
            verticalSpace(16),
            ProfileRowItem(
              title: AppLocalizations.of(context)!.login,
              onTap: () {
                navKey.currentState!.pushNamedAndRemoveUntil(
                    PageRouteName.signIn, (route) => false);
              },
            ),
            const Spacer(),
            const Text(
              'v 6.3.0 - (446)',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            verticalSpace(24),
          ],
        ),
      ),
    );
  }
}
