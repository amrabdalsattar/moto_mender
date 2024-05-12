import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moto_mender/data_layer/repos/product_services_repo_impl.dart';
import 'package:moto_mender/domain_layer/use_cases/product_services_use_cases/add_product_use_case.dart';
import 'package:moto_mender/ui_layer/admin_view/admin_home_screen/admin_services_components/add_product_screen/add_productscreen_components/product_image_components/product_image_handler.dart';
import 'package:moto_mender/ui_layer/shared_components/drop_down_menu.dart';
import 'package:moto_mender/ui_layer/shared_components/button.dart';
import 'package:moto_mender/utils/view_models/add_product_view_model.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/base_states.dart';
import '../../../../../utils/dialog_utils.dart';
import '../../../../shared_components/text_field.dart';

class AddProductScreen extends StatelessWidget {

  static const routeName = "AddPostScreen";

  const AddProductScreen({super.key});

  static AddProductViewModel viewModel =
  AddProductViewModel(AddProductUseCase(ProductServicesRepoImpl()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .canvasColor,
        title: Text(
          "Product",
          style: Theme
              .of(context)
              .textTheme
              .headlineMedium,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.black),
        toolbarHeight: 100,
      ),
      body: BlocListener(
        listener: (_, state) {
          if (state is BaseLoadingState) {
            showLoading(context);
          } else if (state is BaseErrorState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,));
          } else if (state is AddProductSuccessState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,));
          }
        },
        bloc: viewModel,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: viewModel.formKey,
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ProductImageHandler(viewModel: viewModel),
                      CustomTextField(
                          validator: (name) {
                            if (name == null || name.isEmpty) return "Required";
                            return null;
                          },
                          controller: viewModel.name,
                          hintText: "",
                          title: "Name"),
                      CustomTextField(
                          validator: (price) {
                            if (price == null || price.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          controller: viewModel.price,
                          hintText: "",
                          title: "Price"),
                      CustomTextField(
                          validator: (description) {
                            if (description == null || description.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          controller: viewModel.description,
                          hintText: "",
                          title: "Description"),
                      SizedBox(
                        height: 18.h,
                      ),
                      CustomDropDownMenu(controller: viewModel.category),
                      SizedBox(
                        height: 18.h,
                      ),
                      CustomButton(
                        title: "Save Product",
                        onPressed: () {
                          viewModel.addProduct();
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
