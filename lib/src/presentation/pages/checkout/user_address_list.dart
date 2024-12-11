import 'package:flutter/material.dart';
import 'package:flower_app/src/domain/entities/address/address_model.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_states.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_view_model.dart';
import 'package:flower_app/src/presentation/pages/checkout/address_item_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class UserAddressList extends StatefulWidget {
  UserAddressList({super.key});

  @override
  State<UserAddressList> createState() => _UserAddressListState();
}

class _UserAddressListState extends State<UserAddressList> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CheckoutViewModel>();
    return BlocBuilder<CheckoutViewModel, CheckOutStates>(
        builder: (context, state)
    {
      if (state is LoadingState) {
        // Return shimmer effect while loading
        return ListView.builder(
          itemCount: 5, // Placeholder count for shimmer
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: 16.0),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: 80, // Height of each shimmer card
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            );
          },
        );
      }

      if (state is SuccessGetUserSavedAddressState) {

      }

      if (state is FailGetUserSavedAddressState) {
        return const Center(child: Text("Failed to load address"));
      }
      if ((viewModel.userSavedAddress.isEmpty)) {
        return const Center(child: Text("No address found"));
      }
      return ListView.builder(
        itemCount: viewModel.userSavedAddress.length,
        itemBuilder: (context, index) {
          return AddressItemCard(
            address: viewModel.userSavedAddress[index].city,
            value: index,
            addressDetails: viewModel.userSavedAddress[index].street,
            groupValue: viewModel.selectedAddressIndex,
            onChanged: (int? value) {
              setState(() {
                viewModel.selectedAddressIndex = value!;
              });
              },
              );
            },
          );
        },
      );
    }
  }
