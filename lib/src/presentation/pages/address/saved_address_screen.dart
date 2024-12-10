import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flower_app/common/awesome_dialoge.dart';
import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/flower_app.dart';
import 'package:flower_app/src/presentation/widgets/app_text_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/page_route_name.dart';
import '../../../../core/styles/icons/app_icons.dart';
import '../../../data/api/core/error/error_handler.dart';
import '../../managers/address/saved_addresses/address_screen_state.dart';
import '../../managers/address/saved_addresses/address_screen_viewmodel.dart';

class SavedAddressScreen extends StatelessWidget {
  SavedAddressScreen({super.key});

  AddressScreenViewModel _viewModel = getIt<AddressScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.savedAddresses),
      ),
      body: BlocProvider(
        create: (context) => _viewModel..getSavedAddresses(),
        child: Center(
          child: BlocConsumer<AddressScreenViewModel, AddressScreenState>(
            listener: (context, state) {
              if (state is AddressScreenDeleted) {
                _viewModel.getSavedAddresses();

                showAwesomeDialog(context,
                    title: AppLocalizations.of(context)!.success,
                    desc: AppLocalizations.of(context)!.addressDeleted,
                    onOk: () {},
                    dialogType: DialogType.success);
              } else if (state is AddressScreenDeleteError) {
                final errorHandler=ErrorHandler.fromException(state.exception!, AppLocalizations.of(context)!);
                showAwesomeDialog(context,
                    title: AppLocalizations.of(context)!.error,
                    desc: errorHandler.errorMassage,
                    onOk: () {},
                    dialogType: DialogType.error);
              }
            },
            buildWhen: (previous, current) {
              return current is AddressScreenLoaded ||
                  current is AddressScreenDeleted ||
                  current is AddressScreenError ||
                  current is AddressScreenDeleteError ||
                  current is AddressScreenDeleted ||
                  current is AddressScreenDeleteError ||
                  current is AddressScreenInitial ||
                  current is AddressScreenLoading;
            },
            builder: (context, state) {
              if (state is AddressScreenLoading) {
                return CircularProgressIndicator();
              } else if (state is AddressScreenLoaded) {
                if (state.addresses!.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_off,
                            size: 80,
                            color: Colors.grey,
                          ),
                          verticalSpace(16),
                          Text(
                            AppLocalizations.of(context)!.noAddressFound,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          verticalSpace(8),
                          Text(
                            AppLocalizations.of(context)!.addNewAddress,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          verticalSpace(16),
                          AppTextButton(
                              buttonText:
                                  AppLocalizations.of(context)!.addAddress,
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              borderRadius: BorderRadius.circular(30),
                              onPressed: () {
                                navKey.currentState!
                                    .pushNamed(PageRouteName.addAddress);
                              }),
                        ],
                      ),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Expanded ListView for addresses
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.addresses?.length ?? 0,
                          itemBuilder: (context, index) {
                            final address = state.addresses![index];
                            return AddressCard(
                              street: address.street ?? 'Unknown Street',
                              city: address.city ?? 'Unknown City',
                              onDelete: () =>
                                  _viewModel.deleteAddress(address.id!),
                              onEdit: () {
                                // Add edit action here
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Add Address Button
                      AppTextButton(
                        buttonText: AppLocalizations.of(context)!.addAddress,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        onPressed: () async {
                          final result = await navKey.currentState!
                              .pushNamed(PageRouteName.addAddress);
                          if (result == true) {
                            _viewModel.getSavedAddresses(); // Refresh the list
                          }
                        },
                      ),
                    ],
                  ),
                );
              } else if (state is AddressScreenError) {
                final ErrorHandler errorHandler=ErrorHandler.fromException(state.exception, AppLocalizations.of(context)!);
                return Text(errorHandler.errorMassage);
              } else {
                return Text(AppLocalizations.of(context)!.noAddressFound);
              }
            },
          ),
        ),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final String street;
  final String city;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const AddressCard({
    required this.street,
    required this.city,
    required this.onDelete,
    required this.onEdit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade200, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const ImageIcon(
                  AssetImage(AppIcons.locationIcon),
                  size: 20,
                ),
                horizontalSpace(8),
                Expanded(
                  child: Text(
                    street,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: onDelete,
                      icon: const ImageIcon(
                        AssetImage(AppIcons.deleteIcon),
                        size: 24,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: onEdit,
                      icon: const ImageIcon(
                        AssetImage(AppIcons.editIcon),
                        size: 24,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(4),
            Text(
              city,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xff535353),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
