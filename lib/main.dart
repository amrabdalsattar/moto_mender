import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moto_mender/data_layer/repos/auth_repo/auth_repo_impl.dart';
import 'package:moto_mender/data_layer/repos/product_services_repo_impl.dart';
import 'package:moto_mender/domain_layer/use_cases/auth_usecases/login_usecase.dart';
import 'package:moto_mender/domain_layer/use_cases/auth_usecases/register_usecase.dart';
import 'package:moto_mender/domain_layer/use_cases/product_services_use_cases/add_product_use_case.dart';
import 'package:moto_mender/ui_layer/admin_view/admin_home_screen/admin_services_components/add_product_screen.dart';
import 'package:moto_mender/ui_layer/user_view/screens/auth_screens/login_screen.dart';
import 'package:moto_mender/ui_layer/user_view/screens/auth_screens/register_screen.dart';
import 'package:moto_mender/ui_layer/user_view/screens/home_screen/home_screen.dart';
import 'package:moto_mender/utils/app_theme.dart';
import 'package:moto_mender/utils/view_models/add_product_view_model.dart';
import 'package:moto_mender/utils/view_models/login_view_model.dart';
import 'package:moto_mender/utils/view_models/register_view_model.dart';

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
            HomeScreen.routeName: (_) => const HomeScreen(),
            LoginScreen.routeName: (_) => const LoginScreen(),
            RegisterScreen.routeName: (_) => const RegisterScreen(),
            AddProductScreen.routeName: (_) => const AddProductScreen()
          },
          debugShowCheckedModeBanner: false,
          home: const AddProductScreen(),
          theme: AppTheme.themeData,
        ),

    );
  }
}
