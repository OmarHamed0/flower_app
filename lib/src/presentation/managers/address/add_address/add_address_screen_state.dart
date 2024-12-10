sealed class AddAddressScreenState {}

class AddAddressScreenLoading extends AddAddressScreenState {}

class AddAddressScreenSuccessful extends AddAddressScreenState {}

class AddAddressScreenError extends AddAddressScreenState {
  final Exception exception;

  AddAddressScreenError(this.exception);
}

class AddAddressScreenInitial extends AddAddressScreenState {}
