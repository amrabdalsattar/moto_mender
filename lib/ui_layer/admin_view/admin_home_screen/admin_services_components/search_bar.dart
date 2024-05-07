import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.liteGrey,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Search", style: Theme.of(context).textTheme.headlineSmall,),
            ImageIcon(AssetImage(AppAssets.search), color: AppColors.midGrey,)
          ],
        ),
      ),
    );
  }
}
