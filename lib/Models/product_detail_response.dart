class ProductDetailResponse {
  ProductData? data;

  ProductDetailResponse({this.data});

  ProductDetailResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ProductData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProductData {
  String? sId;
  String? title;
  String? currency;
  String? description;
  String? location;
  String? countryFlag;
  int? price;
  int? likesCount;
  int? shareCount;
  int? commentsCount;
  List<String>? media;
  ProductOwner? productOwner;

  ProductData({
    this.sId,
    this.title,
    this.currency,
    this.description,
    this.location,
    this.countryFlag,
    this.price,
    this.likesCount,
    this.shareCount,
    this.commentsCount,
    this.media,
    this.productOwner,
  });

  ProductData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    currency = json['currency'];
    description = json['description'];
    location = json['location'];
    countryFlag = json['countryFlag'];
    price = json['price'];
    likesCount = json['likesCount'];
    shareCount = json['shareCount'];
    commentsCount = json['commentsCount'];
    media = json['media'].cast<String>();
    productOwner = json['productOwner'] != null
        ? ProductOwner.fromJson(json['productOwner'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['currency'] = currency;
    data['description'] = description;
    data['location'] = location;
    data['countryFlag'] = countryFlag;
    data['price'] = price;
    data['likesCount'] = likesCount;
    data['shareCount'] = shareCount;
    data['commentsCount'] = commentsCount;
    data['media'] = media;
    if (productOwner != null) {
      data['productOwner'] = productOwner!.toJson();
    }
    return data;
  }
}

class ProductOwner {
  String? name;
  String? profileImage;

  ProductOwner({this.name, this.profileImage});

  ProductOwner.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['profileImage'] = profileImage;
    return data;
  }
}
