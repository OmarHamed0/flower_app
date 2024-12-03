class AddCartRequest{
  final String? id;
  final int ? quantity;

  AddCartRequest
      ({
    this.id,
    this.quantity
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map["product"] = id;
    map["quantity"] = quantity;
    return map;
  }
}