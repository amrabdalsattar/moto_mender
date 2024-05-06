import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moto_mender/utils/app_assets.dart';
import 'package:moto_mender/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final String prefixIconPath;
  final TextInputType textInputType;
  final bool isPassword;
  final bool eyeVisibility;
  final void Function()? onEyeTap;

const CustomTextField(
      {super.key,
      required this.controller,
      this.validator,
      required this.hintText,
      required this.prefixIconPath,
      required this.textInputType,
      this.isPassword = false,
      required this.title, this.onEyeTap, this.eyeVisibility = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontSize: 16.sp, color: AppColors.midGrey),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            controller: controller,
            validator: validator,
            autofocus: false,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
            keyboardType: textInputType,
            decoration: InputDecoration(
                fillColor: AppColors.textFieldBackground,
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 2.0),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      18.0,
                    ),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.red, width: 2.0),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      18.0,
                    ),
                  ),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      18.0,
                    ),
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      18.0,
                    ),
                  ),
                ),
                isDense: true,
                errorStyle: const TextStyle(fontSize: 15),
                hintText: hintText,
                hintStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.midGrey),
                prefixIcon: ImageIcon(
                  AssetImage(prefixIconPath),
                  color: AppColors.accentColor,
                ),
                suffixIcon: Visibility(
                  visible: eyeVisibility,
                  child: GestureDetector(
                    onTap: onEyeTap,
                    child: ImageIcon(
                      AssetImage(AppAssets.eye),
                    ),
                  ),
                )),
            obscureText: isPassword,
          )
        ],
      ),
    );
  }
}
