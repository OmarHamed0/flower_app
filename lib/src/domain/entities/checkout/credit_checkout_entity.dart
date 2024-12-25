import 'package:json_annotation/json_annotation.dart';

class CreditCheckoutEntity {

  final String message;


  final SessionEntity session;

  CreditCheckoutEntity({
    required this.message,
    required this.session,
  });

}


class SessionEntity {

  final String id;


  final String object;


  final AdaptivePricingEntity adaptivePricing;


  final int? amountSubtotal;


  final int? amountTotal;


  final AutomaticTaxEntity automaticTax;


  final String? cancelUrl;


  final String? clientReferenceId;


  final int created;


  final String currency;


  final CustomerDetailsEntity? customerDetails;


  final String? customerEmail;


  final int expiresAt;


  final MetadataEntity metadata;


  final String mode;


  final String paymentStatus;


  final List<String> paymentMethodTypes;


  final TotalDetailsEntity totalDetails;


  final String url;

  SessionEntity({
    required this.id,
    required this.object,
    required this.adaptivePricing,
    this.amountSubtotal,
    this.amountTotal,
    required this.automaticTax,
    this.cancelUrl,
    this.clientReferenceId,
    required this.created,
    required this.currency,
    this.customerDetails,
    this.customerEmail,
    required this.expiresAt,
    required this.metadata,
    required this.mode,
    required this.paymentStatus,
    required this.paymentMethodTypes,
    required this.totalDetails,
    required this.url,
  });


}


class AdaptivePricingEntity{

  final bool enabled;

  AdaptivePricingEntity({required this.enabled});

}


class AutomaticTaxEntity {

  final bool enabled;


  final dynamic liability;


  final dynamic status;

  AutomaticTaxEntity({
    required this.enabled,
    this.liability,
    this.status,
  });


}

@JsonSerializable()
class CustomerDetailsEntity {

  final dynamic address;


  final String? email;

  final String? name;


  final String? phone;


  final String taxExempt;

  final dynamic taxIds;

  CustomerDetailsEntity({
    this.address,
    this.email,
    this.name,
    this.phone,
    required this.taxExempt,
    this.taxIds,
  });

}


class MetadataEntity {

  final String city;


  final String phone;


  final String street;

  MetadataEntity({
    required this.city,
    required this.phone,
    required this.street,
  });

}


class TotalDetailsEntity {

  final int amountDiscount;


  final int amountShipping;


  final int amountTax;

  TotalDetailsEntity({
    required this.amountDiscount,
    required this.amountShipping,
    required this.amountTax,
  });

}
