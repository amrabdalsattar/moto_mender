import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomElevatedButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      height: 45.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.orange),
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ))),
        child: const Text(
          "Add Product",
        ),
      ),
    );
  }
}
