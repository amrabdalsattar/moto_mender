import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moto_mender/utils/app_colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(

      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: AppColors.transparent),
        backgroundColor: AppColors.whiteBackground,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: true,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
      textTheme: TextTheme(
          headlineMedium: TextStyle(
              color: AppColors.black,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600)));
}
