import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moto_mender/ui_layer/admin_view/admin_home_screen/admin_services_components/add_product_screen.dart';
import 'package:moto_mender/ui_layer/admin_view/admin_home_screen/admin_services_components/custom_button.dart';
import 'package:moto_mender/ui_layer/admin_view/admin_home_screen/admin_services_components/search_bar.dart';
import 'package:moto_mender/ui_layer/user_view/screens/auth_screens/auth_shared_components/text_button.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomSearchBar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const CustomTextButton(text: "View All")
              ],
            ),
            CustomElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AddProductScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
