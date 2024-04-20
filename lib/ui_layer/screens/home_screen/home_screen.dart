import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:moto_mender/ui_layer/screens/home_screen/home_screen_components/custom_app_bar.dart';
import 'package:moto_mender/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: const CustomAppBar(),
      ),
      bottomNavigationBar: Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: GNav(
          backgroundColor: AppColors.white,
          color: AppColors.black,
          hoverColor: AppColors.primary,
          activeColor: AppColors.primary,
          gap: 5.w,
            tabActiveBorder: Border.all(color: AppColors.primary),
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(icon: Icons.home_filled, text: "Home",),
              GButton(icon: Icons.search, text: "Search"),
              GButton(icon: Icons.favorite_border, text: "Favourites"),
              GButton(icon: Icons.person ,text: "Profile"),
            ]),
      ),
    );
  }
}
