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
        iconTheme: IconThemeData(color: AppColors.black)
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
              fontSize: 16.sp,
              fontWeight: FontWeight.w600),
        headlineLarge: TextStyle(
          color: AppColors.accentColor,
          fontSize: 21.sp,
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: AppColors.midGrey,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400
        ),
      )
  );
}
