import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moto_mender/ui_layer/screens/auth_screens/login_screen.dart';
import 'package:moto_mender/ui_layer/screens/auth_screens/register_screen.dart';
import 'package:moto_mender/ui_layer/screens/home_screen/home_screen.dart';

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
          HomeScreen.routeName: (_) =>const HomeScreen(),
          LoginScreen.routeName: (_) => const LoginScreen(),
          RegisterScreen.routeName: (_) => const RegisterScreen()
        },
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
        theme: AppTheme.themeData,
      ),
    );
  }
}
