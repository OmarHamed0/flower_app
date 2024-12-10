import 'package:flower_app/src/domain/entities/address/address_model.dart';

sealed class AddressScreenState {}

class AddressScreenLoading extends AddressScreenState {}

class AddressScreenLoaded extends AddressScreenState {
  final List<AddressModel>? addresses;

  AddressScreenLoaded(this.addresses);
}

class AddressScreenError extends AddressScreenState {
  final Exception exception;

  AddressScreenError(this.exception);
}

class AddressScreenEmpty extends AddressScreenState {}

class AddressScreenInitial extends AddressScreenState {}

class AddressScreenDeleting extends AddressScreenState {}

class AddressScreenDeleted extends AddressScreenState {
  final String message;

  AddressScreenDeleted(this.message);
}

class AddressScreenDeleteError extends AddressScreenState {
  final Exception exception;

  AddressScreenDeleteError(this.exception);
}
