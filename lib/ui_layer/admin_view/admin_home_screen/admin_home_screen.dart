import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moto_mender/ui_layer/user_view/screens/home_screen/home_screen_components/custom_app_bar.dart';

class AdminHomeScreen extends StatelessWidget {
  static const routName = "adminHomeScreen";

  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: const CustomAppBar(),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
      ),
    );
  }
}
