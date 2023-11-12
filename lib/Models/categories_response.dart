class CategoriesResponse {
  List<CategoryData>? categoryData;

  CategoriesResponse({this.categoryData});

  CategoriesResponse.fromJson(Map<String, dynamic> json) {
    if (json['categoryData'] != null) {
      categoryData = <CategoryData>[];
      json['categoryData'].forEach((v) {
        categoryData!.add(CategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categoryData != null) {
      data['categoryData'] = categoryData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryData {
  String? title;
  String? media;

  CategoryData({this.title, this.media});

  CategoryData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    media = json['media'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['media'] = media;
    return data;
  }
}
