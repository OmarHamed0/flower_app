import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/checkout/credit_checkout_entity.dart';

part 'credit_checkout_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CreditCheckoutResponseModel {
  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'session')
  final Session session;

  CreditCheckoutResponseModel({
    required this.message,
    required this.session,
  });

  factory CreditCheckoutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreditCheckoutResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreditCheckoutResponseModelToJson(this);

  CreditCheckoutEntity toDomainDto() {
    return CreditCheckoutEntity(
      message: message,
      session: session.toDomainDto(),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Session {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'object')
  final String object;

  @JsonKey(name: 'adaptive_pricing')
  final AdaptivePricing adaptivePricing;

  @JsonKey(name: 'amount_subtotal')
  final int? amountSubtotal;

  @JsonKey(name: 'amount_total')
  final int? amountTotal;

  @JsonKey(name: 'automatic_tax')
  final AutomaticTax automaticTax;

  @JsonKey(name: 'cancel_url')
  final String? cancelUrl;

  @JsonKey(name: 'client_reference_id')
  final String? clientReferenceId;

  @JsonKey(name: 'created')
  final int created;

  @JsonKey(name: 'currency')
  final String currency;

  @JsonKey(name: 'customer_details')
  final CustomerDetails? customerDetails;

  @JsonKey(name: 'customer_email')
  final String? customerEmail;

  @JsonKey(name: 'expires_at')
  final int expiresAt;

  @JsonKey(name: 'metadata')
  final Metadata metadata;

  @JsonKey(name: 'mode')
  final String mode;

  @JsonKey(name: 'payment_status')
  final String paymentStatus;

  @JsonKey(name: 'payment_method_types')
  final List<String> paymentMethodTypes;

  @JsonKey(name: 'total_details')
  final TotalDetails totalDetails;

  @JsonKey(name: 'url')
  final String url;

  Session({
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

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);

  SessionEntity toDomainDto() {
    return SessionEntity(
      id: id,
      object: object,
      adaptivePricing: adaptivePricing.toDomainDto(),
      amountSubtotal: amountSubtotal,
      amountTotal: amountTotal,
      automaticTax: automaticTax.toDomainDto(),
      cancelUrl: cancelUrl,
      clientReferenceId: clientReferenceId,
      created: created,
      currency: currency,
      customerDetails: customerDetails?.toDomainDto(),
      customerEmail: customerEmail,
      expiresAt: expiresAt,
      metadata: metadata.toDomainDto(),
      mode: mode,
      paymentStatus: paymentStatus,
      paymentMethodTypes: paymentMethodTypes,
      totalDetails: totalDetails.toDomainDto(),
      url: url,
    );
  }
}

@JsonSerializable()
class AdaptivePricing {
  @JsonKey(name: 'enabled')
  final bool enabled;

  AdaptivePricing({required this.enabled});

  factory AdaptivePricing.fromJson(Map<String, dynamic> json) =>
      _$AdaptivePricingFromJson(json);

  Map<String, dynamic> toJson() => _$AdaptivePricingToJson(this);

  AdaptivePricingEntity toDomainDto() {
    return AdaptivePricingEntity(enabled: enabled);
  }
}

@JsonSerializable()
class AutomaticTax {
  @JsonKey(name: 'enabled')
  final bool enabled;

  @JsonKey(name: 'liability')
  final dynamic liability;

  @JsonKey(name: 'status')
  final dynamic status;

  AutomaticTax({
    required this.enabled,
    this.liability,
    this.status,
  });

  factory AutomaticTax.fromJson(Map<String, dynamic> json) =>
      _$AutomaticTaxFromJson(json);

  Map<String, dynamic> toJson() => _$AutomaticTaxToJson(this);

  AutomaticTaxEntity toDomainDto() {
    return AutomaticTaxEntity(
      enabled: enabled,
      liability: liability,
      status: status,
    );
  }
}

@JsonSerializable()
class CustomerDetails {
  @JsonKey(name: 'address')
  final dynamic address;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'phone')
  final String? phone;

  @JsonKey(name: 'tax_exempt')
  final String taxExempt;

  @JsonKey(name: 'tax_ids')
  final dynamic taxIds;

  CustomerDetails({
    this.address,
    this.email,
    this.name,
    this.phone,
    required this.taxExempt,
    this.taxIds,
  });

  factory CustomerDetails.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDetailsToJson(this);

  CustomerDetailsEntity toDomainDto() {
    return CustomerDetailsEntity(
      address: address,
      email: email,
      name: name,
      phone: phone,
      taxExempt: taxExempt,
      taxIds: taxIds,
    );
  }
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: 'city')
  final String city;

  @JsonKey(name: 'phone')
  final String phone;

  @JsonKey(name: 'street')
  final String street;

  Metadata({
    required this.city,
    required this.phone,
    required this.street,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);

  MetadataEntity toDomainDto() {
    return MetadataEntity(
      city: city,
      phone: phone,
      street: street,
    );
  }
}

@JsonSerializable()
class TotalDetails {
  @JsonKey(name: 'amount_discount')
  final int amountDiscount;

  @JsonKey(name: 'amount_shipping')
  final int amountShipping;

  @JsonKey(name: 'amount_tax')
  final int amountTax;

  TotalDetails({
    required this.amountDiscount,
    required this.amountShipping,
    required this.amountTax,
  });

  factory TotalDetails.fromJson(Map<String, dynamic> json) =>
      _$TotalDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TotalDetailsToJson(this);

  TotalDetailsEntity toDomainDto() {
    return TotalDetailsEntity(
      amountDiscount: amountDiscount,
      amountShipping: amountShipping,
      amountTax: amountTax,
    );
  }
}
