import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moto_mender/utils/view_models/add_product_view_model.dart';

import '../../../../../../../utils/app_colors.dart';

class ProductImageHandler extends StatefulWidget {
  final AddProductViewModel viewModel;

  const ProductImageHandler({super.key, required this.viewModel});

  @override
  State<ProductImageHandler> createState() => _ProductImageHandlerState();
}

class _ProductImageHandlerState extends State<ProductImageHandler> {
  final ImagePicker _picker = ImagePicker();
  File? pickImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        fetchImage();
      },
      child: Container(
        width: 80.w,
        height: 70.h,
        decoration: BoxDecoration(
          color: AppColors.liteGrey,
          borderRadius: BorderRadius.circular(40),
        ),
        child: pickImage == null
            ? const Icon(Icons.add_photo_alternate_outlined, size: 50)
            : ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.file(pickImage!, fit: BoxFit.cover)),
      ),
    );
  }

  fetchImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      pickImage = File(image.path);
    });
    widget.viewModel.imagePath = image.path;
  }
}
