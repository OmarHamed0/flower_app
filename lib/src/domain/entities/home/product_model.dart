class ProductsModel {
  ProductsModel({
    String? id,
    String? title,
    String? slug,
    String? description,
    String? imgCover,
    List<String>? images,
    num? price,
    num? priceAfterDiscount,
    num? quantity,
    String? category,
    String? occasion,
    String? createdAt,
    String? updatedAt,
    num? v,
    String? Id,
  }) {
    _id = id;
    _title = title;
    _slug = slug;
    _description = description;
    _imgCover = imgCover;
    _images = images;
    _price = price;
    _priceAfterDiscount = priceAfterDiscount;
    _quantity = quantity;
    _category = category;
    _occasion = occasion;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _id = id;
  }

  ProductsModel.fromJson(dynamic json) {
    _id = json['_id'];
    _title = json['title'];
    _slug = json['slug'];
    _description = json['description'];
    _imgCover = json['imgCover'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _price = json['price'];
    _priceAfterDiscount = json['priceAfterDiscount'];
    _quantity = json['quantity'];
    _category = json['category'];
    _occasion = json['occasion'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _id = json['id'];
  }
  String? _id;
  String? _title;
  String? _slug;
  String? _description;
  String? _imgCover;
  List<String>? _images;
  num? _price;
  num? _priceAfterDiscount;
  num? _quantity;
  String? _category;
  String? _occasion;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  String? Id;

  String? get id => _id;
  String? get title => _title;
  String? get slug => _slug;
  String? get description => _description;
  String? get imgCover => _imgCover;
  List<String>? get images => _images;
  num? get price => _price;
  num? get priceAfterDiscount => _priceAfterDiscount;
  num? get quantity => _quantity;
  String? get category => _category;
  String? get occasion => _occasion;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['title'] = _title;
    map['slug'] = _slug;
    map['description'] = _description;
    map['imgCover'] = _imgCover;
    map['images'] = _images;
    map['price'] = _price;
    map['priceAfterDiscount'] = _priceAfterDiscount;
    map['quantity'] = _quantity;
    map['category'] = _category;
    map['occasion'] = _occasion;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['id'] = _id;
    return map;
  }
}
