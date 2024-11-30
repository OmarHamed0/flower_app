import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flower_app/common/awesome_dialoge.dart';
import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/icons/app_icons.dart';
import 'package:flower_app/src/domain/entities/auth/user_entity.dart';
import 'package:flower_app/src/presentation/managers/profile/profile_screen_state.dart';
import 'package:flower_app/src/presentation/managers/profile/profile_screen_viewmodel.dart';
import 'package:flower_app/src/presentation/widgets/profile/custom_app_bar_profile.dart';
import 'package:flower_app/src/presentation/widgets/profile/name_and_email.dart';
import 'package:flower_app/src/presentation/widgets/profile/profile_image.dart';
import 'package:flower_app/src/presentation/widgets/profile/profile_row_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../flower_app.dart';

class MainProfileBody extends StatelessWidget {
  final VoidCallback onEdit;
  final UserEntity? user;

  MainProfileBody({super.key, required this.onEdit, required this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: BlocListener<ProfileScreenViewModel, ProfileScreenState>(
          listener: (context, state) {
            if (state is ProfileScreenLogout) {
              navKey.currentState!.pushNamedAndRemoveUntil(
                PageRouteName.signIn,
                (route) => false,
              );
            }
          },
          child: Column(
            children: [
              const CustomAppBarProfile(),
              Center(
                child: ProfileImage(
                  imageUrl: user?.photo,
                ),
              ),
              verticalSpace(8),
              NameAndEmail(
                name: user?.firstName,
                email: user?.email,
                onEdit: onEdit,
              ),
              verticalSpace(32),
              ProfileRowItem(
                title: AppLocalizations.of(context)!.myOrders,
                icon: AppIcons.orderIcon,
              ),
              verticalSpace(16),
              ProfileRowItem(
                title: AppLocalizations.of(context)!.savedAddresses,
                icon: AppIcons.locationIcon,
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
                title: AppLocalizations.of(context)!.logout,
                onTap: () {
                  showAwesomeDialog(
                    context,
                    title: AppLocalizations.of(context)!.logOut,
                    desc: AppLocalizations.of(context)!.confirmLogout,
                    onOk: () {
                      context.read<ProfileScreenViewModel>().logOut();
                    },
                    dialogType: DialogType.warning,
                    onCancel: () {},
                  );
                },
              ),
              Spacer(),
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
      ),
    );
  }
}
