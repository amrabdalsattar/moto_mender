import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moto_mender/utils/app_colors.dart';

class CustomDropDownMenu extends StatefulWidget {
  final TextEditingController controller;
  const CustomDropDownMenu({Key? key, required this.controller}) : super(key: key);

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<String>> items = [
      const DropdownMenuItem(value: "hello", child: Text("hello")),
      const DropdownMenuItem(value: "boy", child: Text("boy")),
      const DropdownMenuItem(value: "iam", child: Text("iam")),
      const DropdownMenuItem(value: "danny", child: Text("danny")),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Category",
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontSize: 13.sp, color: AppColors.grey),
        ),
        SizedBox(
          height: 10.h,
        ),
        ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField(
            isDense: true,
            borderRadius: BorderRadius.circular(10),
            dropdownColor: AppColors.textFieldBackground,
            decoration: InputDecoration(
              hintText: "Choose the Product Category",
              hintStyle: Theme.of(context).textTheme.headlineSmall,
              filled: true,
              fillColor: AppColors.textFieldBackground,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),

            items: items,
            value: _selectedValue,
            onChanged: (selectedValue) {
              if (selectedValue != null) {
                setState(() {
                  _selectedValue = selectedValue as String;
                  widget.controller.text = selectedValue;
                });
              }
            },
            style: Theme.of(context).textTheme.labelMedium,

          ),
        ),
      ],
    );
  }
}
