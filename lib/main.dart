import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:streamedinc/Utils/providers.dart';

import 'AppNavigation/app_navigation.dart';
import 'Router/app_router.dart';
import 'Utils/app_theme.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();

  // change status bar icons color
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        return MultiProvider(
          providers: providers,
          child: MaterialApp(
            title: 'Streamed Inc',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            onGenerateRoute: AppRouter.onRouteGenerate,
            initialRoute: RoutesConstants.initial,
            navigatorKey: AppNavigation.navigationKey,
          ),
        );
      },
    );
  }
}
