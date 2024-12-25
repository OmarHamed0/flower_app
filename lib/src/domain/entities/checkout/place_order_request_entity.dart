import '../../../data/api/core/requestes_models/checkout_place_order_request_model/place_order_request_model.dart';
import '../place_order/shipping_address_entity.dart';

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

