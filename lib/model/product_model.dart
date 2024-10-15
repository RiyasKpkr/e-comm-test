class ProductsModel {
  int? success;
  String? message;
  Products? products;

  ProductsModel({
    this.success,
    this.message,
    this.products,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        success: json["success"],
        message: json["message"],
        products: json["products"] == null ? null : Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "products": products?.toJson(),
      };
}

class Products {
  Return? productsReturn;
  List<dynamic>? categories;
  List<dynamic>? newProducts;

  Products({
    this.productsReturn,
    this.categories,
    this.newProducts,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        productsReturn: json["return"] == null ? null : Return.fromJson(json["return"]),
        categories: json["categories"] == null ? [] : List<dynamic>.from(json["categories"]!.map((x) => x)),
        newProducts: json["new_products"] == null ? [] : List<dynamic>.from(json["new_products"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "return": productsReturn?.toJson(),
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
        "new_products": newProducts == null ? [] : List<dynamic>.from(newProducts!.map((x) => x)),
      };
}

class Return {
  int? currentPage;
  List<SingleProduct>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Return({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Return.fromJson(Map<String, dynamic> json) => Return(
        currentPage: json["current_page"],
        data: json["data"] == null ? [] : List<SingleProduct>.from(json["data"]!.map((x) => SingleProduct.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class SingleProduct {
  String? slug;
  int? status;
  String? storeslug;
  String? purchaseReward;
  String? rewardPoint;
  String? code;
  String? name;
  String? appDescription;
  String? stock;
  String? symbolLeft;
  String? symbolRight;
  String? oldprice;
  String? price;
  String? discount;
  String? rating;
  String? image;
  int? wishlist;
  int? cart;
  String? store;
  String? manufacturer;

  SingleProduct({
    this.slug,
    this.status,
    this.storeslug,
    this.purchaseReward,
    this.rewardPoint,
    this.code,
    this.name,
    this.appDescription,
    this.stock,
    this.symbolLeft,
    this.symbolRight,
    this.oldprice,
    this.price,
    this.discount,
    this.rating,
    this.image,
    this.wishlist,
    this.cart,
    this.store,
    this.manufacturer,
  });

  factory SingleProduct.fromJson(Map<String, dynamic> json) => SingleProduct(
        slug: json["slug"],
        status: json["status"],
        storeslug: json["storeslug"],
        purchaseReward: json["purchase_reward"],
        rewardPoint: json["reward_point"],
        code: json["code"],
        name: json["name"],
        appDescription: json["app_description"],
        stock: json["stock"],
        symbolLeft: json["symbol_left"],
        symbolRight: json["symbol_right"],
        oldprice: json["oldprice"],
        price: json["price"],
        discount: json["discount"],
        rating: json["rating"],
        image: json["image"],
        wishlist: json["wishlist"],
        cart: json["cart"],
        store: json["store"],
        manufacturer: json["manufacturer"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "status": status,
        "storeslug": storeslug,
        "purchase_reward": purchaseReward,
        "reward_point": rewardPoint,
        "code": code,
        "name": name,
        "app_description": appDescription,
        "stock": stock,
        "symbol_left": symbolLeft,
        "symbol_right": symbolRight,
        "oldprice": oldprice,
        "price": price,
        "discount": discount,
        "rating": rating,
        "image": image,
        "wishlist": wishlist,
        "cart": cart,
        "store": store,
        "manufacturer": manufacturer,
      };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
