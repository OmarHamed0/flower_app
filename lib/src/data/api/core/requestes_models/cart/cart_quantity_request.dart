class CartQuantityRequest {
  final int? quantity;

  CartQuantityRequest({
    this.quantity,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map["quantity"] = quantity;
    return map;
  }
}
