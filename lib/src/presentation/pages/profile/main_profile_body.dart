import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flower_app/common/awesome_dialoge.dart';
import 'package:flower_app/common/common.dart';
import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/fonts/app_fonts.dart';
import 'package:flower_app/core/styles/icons/app_icons.dart';
import 'package:flower_app/src/presentation/managers/localization/localization_cubit.dart';
import 'package:flower_app/src/presentation/managers/profile/profile_viewmodel/profile_screen_state.dart';
import 'package:flower_app/src/presentation/widgets/profile/custom_app_bar_profile.dart';
import 'package:flower_app/src/presentation/widgets/profile/name_and_email.dart';
import 'package:flower_app/src/presentation/widgets/profile/profile_image.dart';
import 'package:flower_app/src/presentation/widgets/profile/profile_row_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../flower_app.dart';
import '../../../data/api/core/error/error_handler.dart';
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
            }
            else if (state is ProfileScreenLoaded) {
              return SingleChildScrollView(
                child: Column(
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
                        icon: AppIcons.resetPassword,
                      ),
                    ),
                    verticalSpace(16),
                    InkWell(
                     onTap: () =>_showLanguageBottomSheet(context),
                      child: ProfileRowItem(
                        title: AppLocalizations.of(context)!.language,
                        icon: AppIcons.localeIcon,
                      ),
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
              );
            }
            else if (state is ProfileGuestScreenLoadedState) {
              return GuestProfile(user: state.user);
            } else if (state is ProfileScreenError) {
              final errorHandler=ErrorHandler.fromException(state.exception, AppLocalizations.of(context)!);
              return Center(
                child: Text(errorHandler.errorMassage),
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



  Future<void> _showLanguageBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height:230.h,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.chooseLanguage,
                style: AppFonts.font20Black500Weight,
              ),
              verticalSpace(16),
              InkWell(
                onTap: () {
                BlocProvider.of<LocalizationCubit>(context).cachingLanguageCode(languageCode: "en");
                  Navigator.pop(context);
                },
                child: ListTile(
                  leading:  const Icon(Icons.language, color: AppColors.kBlue),
                  title: Text(
                    AppLocalizations.of(context)!.english,
                    style: AppFonts.font20Black500Weight,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  BlocProvider.of<LocalizationCubit>(context).cachingLanguageCode(languageCode: "ar");
                  Navigator.pop(context);
                },
                child: ListTile(
                  leading: const Icon(Icons.language, color: AppColors.kSuccess),
                  title: Text(
                    AppLocalizations.of(context)!.arabic,
                    style: AppFonts.font20Black500Weight,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }



  // Future<void> _pickImage(ImageSource imageSource) async {
  //   final pickedFile = await _picker.pickImage(source: imageSource);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //       profileViewModel.doAction(UploadPhoto(_image!));
  //       debugPrint(_image.toString());
  //     });
  //   }
  // }
}
