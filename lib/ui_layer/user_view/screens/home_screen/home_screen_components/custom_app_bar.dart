import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moto_mender/utils/app_assets.dart';
import 'package:moto_mender/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteBackground,
      padding: const EdgeInsets.only(top: 25),
      child: AppBar(
        toolbarHeight: 40,
        titleSpacing: 26.w,
        primary: true,
        title: Text(
          "MotoMender",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 26.w),
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: (){},
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.liteGrey, width: 1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.asset(
                  AppAssets.shoppingBag,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

