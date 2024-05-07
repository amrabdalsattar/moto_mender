import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moto_mender/data_layer/repos/product_services_repo_impl.dart';
import 'package:moto_mender/domain_layer/use_cases/product_services_use_cases/add_product_use_case.dart';
import 'package:moto_mender/ui_layer/shared_components/drop_down_menu.dart';
import 'package:moto_mender/utils/view_models/add_product_view_model.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/base_states.dart';
import '../../../../utils/dialog_utils.dart';
import '../../../user_view/screens/auth_screens/auth_shared_components/text_field.dart';

class AddProductScreen extends StatelessWidget {
  static const routeName = "AddPostScreen";
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddProductViewModel viewModel =
        AddProductViewModel(AddProductUseCase(ProductServicesRepoImpl()));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        title: Text(
          "Product",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.black),
        toolbarHeight: 100,
      ),
      body: BlocListener(
        listener: (context, state) {

          if(state is BaseLoadingState){
            showLoading(context);
          }else if(state is BaseErrorState){
            Navigator.pop(context);
          }else if(state is BaseSuccessState){
            Navigator.pop(context);
          }
        },
        bloc: viewModel,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: viewModel.formKey,
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 80.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                          color: AppColors.liteGrey,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add_photo_alternate_outlined,
                              size: 50),
                          onPressed: () {},
                        ),
                      ),
                      CustomTextField(
                          controller: viewModel.name,
                          hintText: "",
                          title: "Name"),
                      CustomTextField(
                          controller: viewModel.price,
                          hintText: "",

                          title: "Price"),
                      CustomTextField(
                          controller: viewModel.description,
                          hintText: "",
                          title: "Description"),
                      SizedBox(height: 18.h,),
                      CustomDropDownMenu(controller: viewModel.category),
                      CustomTextField(
                          controller: viewModel.quantity,
                          hintText: "",
                          title: "Quantity")
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
