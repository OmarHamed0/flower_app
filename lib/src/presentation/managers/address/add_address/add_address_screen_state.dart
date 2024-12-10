sealed class AddAddressScreenState {}

class AddAddressScreenLoading extends AddAddressScreenState {}

class AddAddressScreenSuccessful extends AddAddressScreenState {}

class AddAddressScreenError extends AddAddressScreenState {
  final String message;

  AddAddressScreenError(this.message);
}

class AddAddressScreenInitial extends AddAddressScreenState {}
