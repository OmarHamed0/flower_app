import '../../../data/api/core/requestes_models/checkout_place_order_request_model/place_order_request_model.dart';

class PlaceOrderRequestEntity {
  final ShippingAddressEntity? shippingAddressEntity;

  PlaceOrderRequestEntity({
    this.shippingAddressEntity,
  });

  PlaceOrderRequestModel toData() {
    return PlaceOrderRequestModel(
      shippingAddress: ShippingAddress(
          street: shippingAddressEntity?.street,
          phone: shippingAddressEntity?.phone,
          city: shippingAddressEntity?.city),
    );
  }
}

class ShippingAddressEntity {
  final String? street;
  final String? phone;
  final String? city;

  ShippingAddressEntity({
    this.street,
    this.phone,
    this.city,
  });
}
