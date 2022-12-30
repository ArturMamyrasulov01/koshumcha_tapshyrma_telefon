// ignore_for_file: unnecessary_getters_setters, prefer_collection_literals, duplicate_ignore

class PhoneModel {
  List<HomeStore>? _homeStore;
  List<BestSeller>? _bestSeller;

  PhoneModel({List<HomeStore>? homeStore, List<BestSeller>? bestSeller}) {
    if (homeStore != null) {
      _homeStore = homeStore;
    }
    if (bestSeller != null) {
      _bestSeller = bestSeller;
    }
  }

  List<HomeStore>? get homeStore => _homeStore;
  set homeStore(List<HomeStore>? homeStore) => _homeStore = homeStore;
  // ignore: unnecessary_getters_setters
  List<BestSeller>? get bestSeller => _bestSeller;
  set bestSeller(List<BestSeller>? bestSeller) => _bestSeller = bestSeller;

  PhoneModel.fromJson(Map<String, dynamic> json) {
    if (json['home_store'] != null) {
      _homeStore = <HomeStore>[];
      json['home_store'].forEach((v) {
        _homeStore!.add(HomeStore.fromJson(v));
      });
    }
    if (json['best_seller'] != null) {
      _bestSeller = <BestSeller>[];
      json['best_seller'].forEach((v) {
        _bestSeller!.add(BestSeller.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (_homeStore != null) {
      data['home_store'] = _homeStore!.map((v) => v.toJson()).toList();
    }
    if (_bestSeller != null) {
      data['best_seller'] = _bestSeller!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeStore {
  int? _id;
  bool? _isNew;
  String? _title;
  String? _subtitle;
  String? _picture;
  bool? _isBuy;

  HomeStore(
      {int? id,
      bool? isNew,
      String? title,
      String? subtitle,
      String? picture,
      bool? isBuy}) {
    if (id != null) {
      _id = id;
    }
    if (isNew != null) {
      _isNew = isNew;
    }
    if (title != null) {
      _title = title;
    }
    if (subtitle != null) {
      _subtitle = subtitle;
    }
    if (picture != null) {
      _picture = picture;
    }
    if (isBuy != null) {
      _isBuy = isBuy;
    }
  }

  // ignore: unnecessary_getters_setters
  int? get id => _id;
  set id(int? id) => _id = id;
  // ignore: unnecessary_getters_setters
  bool? get isNew => _isNew;
  set isNew(bool? isNew) => _isNew = isNew;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get subtitle => _subtitle;
  set subtitle(String? subtitle) => _subtitle = subtitle;
  String? get picture => _picture;
  set picture(String? picture) => _picture = picture;
  bool? get isBuy => _isBuy;
  set isBuy(bool? isBuy) => _isBuy = isBuy;

  HomeStore.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _isNew = json['is_new'];
    _title = json['title'];
    _subtitle = json['subtitle'];
    _picture = json['picture'];
    _isBuy = json['is_buy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = _id;
    data['is_new'] = _isNew;
    data['title'] = _title;
    data['subtitle'] = _subtitle;
    data['picture'] = _picture;
    data['is_buy'] = _isBuy;
    return data;
  }
}

class BestSeller {
  int? _id;
  bool? _isFavorites;
  String? _title;
  int? _priceWithoutDiscount;
  int? _discountPrice;
  String? _picture;

  BestSeller(
      {int? id,
      bool? isFavorites,
      String? title,
      int? priceWithoutDiscount,
      int? discountPrice,
      String? picture}) {
    if (id != null) {
      _id = id;
    }
    if (isFavorites != null) {
      _isFavorites = isFavorites;
    }
    if (title != null) {
      _title = title;
    }
    if (priceWithoutDiscount != null) {
      _priceWithoutDiscount = priceWithoutDiscount;
    }
    if (discountPrice != null) {
      _discountPrice = discountPrice;
    }
    if (picture != null) {
      _picture = picture;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  bool? get isFavorites => _isFavorites;
  set isFavorites(bool? isFavorites) => _isFavorites = isFavorites;
  String? get title => _title;
  set title(String? title) => _title = title;
  int? get priceWithoutDiscount => _priceWithoutDiscount;
  set priceWithoutDiscount(int? priceWithoutDiscount) =>
      _priceWithoutDiscount = priceWithoutDiscount;
  int? get discountPrice => _discountPrice;
  set discountPrice(int? discountPrice) => _discountPrice = discountPrice;
  String? get picture => _picture;
  set picture(String? picture) => _picture = picture;

  BestSeller.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _isFavorites = json['is_favorites'];
    _title = json['title'];
    _priceWithoutDiscount = json['price_without_discount'];
    _discountPrice = json['discount_price'];
    _picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = _id;
    data['is_favorites'] = _isFavorites;
    data['title'] = _title;
    data['price_without_discount'] = _priceWithoutDiscount;
    data['discount_price'] = _discountPrice;
    data['picture'] = _picture;
    return data;
  }
}
