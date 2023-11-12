import 'package:flutter/material.dart';

import '../Models/product_detail_response.dart';

class ProductDetailProvider extends ChangeNotifier {
  late ProductDetailResponse _productDetailResponse;
  late PageController controller;
  int currentMediaPage = 0;

  init() {
    controller = PageController();
    controller.addListener(() {
      currentMediaPage = controller.page!.round();
      notifyListeners();
    });
  }

  changeMediaPage(int index) {
    controller.animateToPage(index,
        duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
  }

  setResponse(ProductDetailResponse response) {
    _productDetailResponse = response;
  }

  String get title => _productDetailResponse.data?.title ?? '';

  String get description => _productDetailResponse.data?.description ?? '';

  String get location => _productDetailResponse.data?.location ?? '';

  String get countryFlag => _productDetailResponse.data?.countryFlag ?? '';

  String get currency => _productDetailResponse.data?.currency ?? '';

  int get price => _productDetailResponse.data?.price ?? 0;

  List<String> get mediaList => _productDetailResponse.data?.media ?? [];

  int get likesCount => _productDetailResponse.data?.likesCount ?? 0;

  int get commentsCount => _productDetailResponse.data?.commentsCount ?? 0;

  int get shareCount => _productDetailResponse.data?.shareCount ?? 0;

  String get ownerName => _productDetailResponse.data?.productOwner?.name ?? '';

  String get ownerProfileImage =>
      _productDetailResponse.data?.productOwner?.profileImage ?? '';
}
