import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:streamedinc/Providers/chatting_provider.dart';

import '../Providers/bottom_navigation_provider.dart';
import '../Providers/categories_provider.dart';
import '../Providers/product_detail_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => BottomNavigationProvider()),
  ChangeNotifierProvider(create: (_) => ProductDetailProvider()),
  ChangeNotifierProvider(create: (_) => CategoriesProvider()),
  ChangeNotifierProvider(create: (_) => ChattingProvider()),
];
