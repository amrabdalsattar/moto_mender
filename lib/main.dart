import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moto_mender/ui_layer/admin_view/admin_home_screen/admin_home_screen.dart';
import 'package:moto_mender/ui_layer/admin_view/admin_home_screen/admin_services_components/add_product_screen/add_product_screen.dart';
import 'package:moto_mender/ui_layer/admin_view/admin_home_screen/admin_services_components/all_categories_view/all_categories_screen.dart';
import 'package:moto_mender/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        routes: {
          AdminHomeScreen.routeName: (_) => const AdminHomeScreen(),
          AddProductScreen.routeName: (_) => const AddProductScreen(),
          AllCategoriesScreen.routeName: (_) => const AllCategoriesScreen(),
        },
        debugShowCheckedModeBanner: false,
        home: const AdminHomeScreen(),
        theme: AppTheme.themeData,
      ),
    );
  }
}
