enum ProductEndPoints {
  products,
  besetSeller,
}

enum ProductQuery { category, occasion , search }

abstract class ProductQueryParams {
  Map<String, dynamic>? getQueryParameters(String? productId);
}

class CategoryQueryParams implements ProductQueryParams {
  @override
  Map<String, dynamic>? getQueryParameters(String? productId) {
    return {"category": productId};
  }
}

class OccasionQueryParams implements ProductQueryParams {
  @override
  Map<String, dynamic>? getQueryParameters(String? productId) {
    return {"occasion": productId};
  }
}

class NoQueryParams implements ProductQueryParams {
  @override
  Map<String, dynamic>? getQueryParameters(String? productId) {
    return null;
  }
}

class SearchProductParams implements ProductQueryParams {
  @override
  Map<String, dynamic>? getQueryParameters(String? productId) {
    return {"keyword": productId};
  }
}

class ProductQueryFactory {
  static ProductQueryParams getProductQueryParams(ProductQuery? productQuery) {
    switch (productQuery) {
      case ProductQuery.category:
        return CategoryQueryParams();
      case ProductQuery.occasion:
        return OccasionQueryParams();
      case null:
        return NoQueryParams();
        case ProductQuery.search:
        return SearchProductParams();
    }
  }
}