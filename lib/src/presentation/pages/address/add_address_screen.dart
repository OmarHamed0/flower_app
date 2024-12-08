import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flower_app/common/awesome_dialoge.dart';
import 'package:flower_app/config/helpers/validations.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/images/app_images.dart';
import 'package:flower_app/core/widgets/custom_auth_text_feild.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/flower_app.dart';
import 'package:flower_app/src/presentation/managers/address/add_address/add_address_screen_viewmodel.dart';
import 'package:flower_app/src/presentation/widgets/app_text_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/common.dart';
import '../../managers/address/add_address/add_address_screen_state.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddAddressScreenViewModel _viewModel =
        getIt<AddAddressScreenViewModel>();

    return BlocProvider(
      create: (context) => _viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.addAddress),
        ),
        body: BlocListener<AddAddressScreenViewModel, AddAddressScreenState>(
          listener: (context, state) {
            if (state is AddAddressScreenError) {
              showAwesomeDialog(
                context,
                title: AppLocalizations.of(context)!.error,
                desc: state.message,
                onOk: () {},
                dialogType: DialogType.error,
              );
            }
            if (state is AddAddressScreenSuccessful) {
              showAwesomeDialog(
                context,
                title: AppLocalizations.of(context)!.success,
                desc: AppLocalizations.of(context)!.addressAddedSuccessfully,
                onOk: () {
                  navKey.currentState!.pop(true);
                },
                dialogType: DialogType.success,
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Form(
                key: _viewModel.formKey,
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.mapImage,
                      width: double.infinity,
                      height: 145, // Remove the .h if unnecessary
                      fit: BoxFit.cover,
                    ),
                    verticalSpace(24),
                    CustomTextFormField(
                      labelText: AppLocalizations.of(context)!.street,
                      hintText: AppLocalizations.of(context)!.enterYourStreet,
                      keyboardType: TextInputType.text,
                      controller: _viewModel.streetController,
                      validator: (value) => validateStreet(value),
                    ),
                    verticalSpace(24),
                    CustomTextFormField(
                      labelText: AppLocalizations.of(context)!.city,
                      hintText: AppLocalizations.of(context)!.enterYourCity,
                      keyboardType: TextInputType.text,
                      controller: _viewModel.cityController,
                      validator: (value) => validateCity(value),
                    ),
                    verticalSpace(24),
                    CustomTextFormField(
                      labelText: AppLocalizations.of(context)!.phone,
                      hintText: AppLocalizations.of(context)!.enterYourPhone,
                      keyboardType: TextInputType.text,
                      controller: _viewModel.phoneController,
                      validator: (value) => validatePhoneNumber(value),
                    ),
                    verticalSpace(24),
                    AppTextButton(
                      buttonText: AppLocalizations.of(context)!.addAddress,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      onPressed: () {
                        _viewModel.addNewAddress();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
