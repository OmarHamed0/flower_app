import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flower_app/common/awesome_dialoge.dart';
import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/icons/app_icons.dart';
import 'package:flower_app/src/presentation/managers/profile/profile_viewmodel/profile_screen_state.dart';
import 'package:flower_app/src/presentation/widgets/profile/custom_app_bar_profile.dart';
import 'package:flower_app/src/presentation/widgets/profile/name_and_email.dart';
import 'package:flower_app/src/presentation/widgets/profile/profile_image.dart';
import 'package:flower_app/src/presentation/widgets/profile/profile_row_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../flower_app.dart';
import '../../managers/profile/profile_viewmodel/profile_actions.dart';
import '../../managers/profile/profile_viewmodel/profile_screen_viewmodel.dart';
import 'guest_profile_screen.dart';

class MainProfileBody extends StatelessWidget {
  final VoidCallback onEdit;

  MainProfileBody({super.key, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: BlocConsumer<ProfileScreenViewModel, ProfileScreenState>(
          listener: (context, state) {
            if (state is ProfileScreenLogout) {
              navKey.currentState!.pushNamedAndRemoveUntil(
                PageRouteName.signIn,
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            final _viewModel = context.read<ProfileScreenViewModel>();
            if (state is ProfileScreenLoading) {
              _viewModel.doAction(GetUserDataProfileAction());
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProfileScreenLoaded) {
              return Column(
                children: [
                  const CustomAppBarProfile(),
                  Center(
                    child: ProfileImage(
                      imageUrl: state.user?.photo,
                    ),
                  ),
                  verticalSpace(8),
                  NameAndEmail(
                    name: state.user?.firstName,
                    email: state.user?.email,
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
                  ProfileRowItem(
                      title: AppLocalizations.of(context)!.notification),
                  verticalSpace(16),
                  const Divider(),
                  verticalSpace(16),
                  InkWell(
                    onTap: () {
                      navKey.currentState!
                          .pushNamed(PageRouteName.resetPassword);
                    },
                    child: ProfileRowItem(
                      title: AppLocalizations.of(context)!.changePassword,
                      icon: AppIcons.resetPasswordIcon,
                    ),
                  ),
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
                          context
                              .read<ProfileScreenViewModel>()
                              .doAction(const LogOutProfileAction());
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
              );
            } else if (state is ProfileGuestScreenLoadedState) {
              return GuestProfile(user: state.user);
            } else if (state is ProfileScreenError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Center(
                child: Text(AppLocalizations.of(context)!.somethingWentWrong),
              );
            }
          },
        ),
      ),
    );
  }
}
