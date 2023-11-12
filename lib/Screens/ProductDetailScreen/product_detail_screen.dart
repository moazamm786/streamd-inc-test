import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamedinc/Providers/product_detail_provider.dart';
import 'package:streamedinc/Services/categories_service.dart';
import 'package:streamedinc/Services/product_service.dart';

import '../../Components/ProductDetail/product_detail_component.dart';
import '../../Components/Widgets/FutureProvider/custom_future_builder.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late Future getData;

  callApi() {
    getData = Future.wait([
      ProductService().getProductDetail(),
      CategoriesService().getCategories(),
    ]);
  }

  @override
  void initState() {
    context.read<ProductDetailProvider>().init();
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomFutureBuilder(
        future: getData,
        child: const ProductDetailComponent(),
      ),
    );
  }
}
