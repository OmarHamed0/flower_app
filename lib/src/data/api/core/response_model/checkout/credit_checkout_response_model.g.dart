// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_checkout_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCheckoutResponseModel _$CreditCheckoutResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreditCheckoutResponseModel(
      message: json['message'] as String,
      session: Session.fromJson(json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreditCheckoutResponseModelToJson(
        CreditCheckoutResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'session': instance.session.toJson(),
    };

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      id: json['id'] as String,
      object: json['object'] as String,
      adaptivePricing: AdaptivePricing.fromJson(
          json['adaptive_pricing'] as Map<String, dynamic>),
      amountSubtotal: (json['amount_subtotal'] as num?)?.toInt(),
      amountTotal: (json['amount_total'] as num?)?.toInt(),
      automaticTax:
          AutomaticTax.fromJson(json['automatic_tax'] as Map<String, dynamic>),
      cancelUrl: json['cancel_url'] as String?,
      clientReferenceId: json['client_reference_id'] as String?,
      created: (json['created'] as num).toInt(),
      currency: json['currency'] as String,
      customerDetails: json['customer_details'] == null
          ? null
          : CustomerDetails.fromJson(
              json['customer_details'] as Map<String, dynamic>),
      customerEmail: json['customer_email'] as String?,
      expiresAt: (json['expires_at'] as num).toInt(),
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      mode: json['mode'] as String,
      paymentStatus: json['payment_status'] as String,
      paymentMethodTypes: (json['payment_method_types'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      totalDetails:
          TotalDetails.fromJson(json['total_details'] as Map<String, dynamic>),
      url: json['url'] as String,
    );

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'adaptive_pricing': instance.adaptivePricing.toJson(),
      'amount_subtotal': instance.amountSubtotal,
      'amount_total': instance.amountTotal,
      'automatic_tax': instance.automaticTax.toJson(),
      'cancel_url': instance.cancelUrl,
      'client_reference_id': instance.clientReferenceId,
      'created': instance.created,
      'currency': instance.currency,
      'customer_details': instance.customerDetails?.toJson(),
      'customer_email': instance.customerEmail,
      'expires_at': instance.expiresAt,
      'metadata': instance.metadata.toJson(),
      'mode': instance.mode,
      'payment_status': instance.paymentStatus,
      'payment_method_types': instance.paymentMethodTypes,
      'total_details': instance.totalDetails.toJson(),
      'url': instance.url,
    };

AdaptivePricing _$AdaptivePricingFromJson(Map<String, dynamic> json) =>
    AdaptivePricing(
      enabled: json['enabled'] as bool,
    );

Map<String, dynamic> _$AdaptivePricingToJson(AdaptivePricing instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

AutomaticTax _$AutomaticTaxFromJson(Map<String, dynamic> json) => AutomaticTax(
      enabled: json['enabled'] as bool,
      liability: json['liability'],
      status: json['status'],
    );

Map<String, dynamic> _$AutomaticTaxToJson(AutomaticTax instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'liability': instance.liability,
      'status': instance.status,
    };

CustomerDetails _$CustomerDetailsFromJson(Map<String, dynamic> json) =>
    CustomerDetails(
      address: json['address'],
      email: json['email'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      taxExempt: json['tax_exempt'] as String,
      taxIds: json['tax_ids'],
    );

Map<String, dynamic> _$CustomerDetailsToJson(CustomerDetails instance) =>
    <String, dynamic>{
      'address': instance.address,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'tax_exempt': instance.taxExempt,
      'tax_ids': instance.taxIds,
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      city: json['city'] as String,
      phone: json['phone'] as String,
      street: json['street'] as String,
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'city': instance.city,
      'phone': instance.phone,
      'street': instance.street,
    };

TotalDetails _$TotalDetailsFromJson(Map<String, dynamic> json) => TotalDetails(
      amountDiscount: (json['amount_discount'] as num).toInt(),
      amountShipping: (json['amount_shipping'] as num).toInt(),
      amountTax: (json['amount_tax'] as num).toInt(),
    );

Map<String, dynamic> _$TotalDetailsToJson(TotalDetails instance) =>
    <String, dynamic>{
      'amount_discount': instance.amountDiscount,
      'amount_shipping': instance.amountShipping,
      'amount_tax': instance.amountTax,
    };
