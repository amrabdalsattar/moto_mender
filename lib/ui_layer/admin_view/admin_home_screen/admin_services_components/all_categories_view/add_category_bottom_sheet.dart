import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moto_mender/ui_layer/shared_components/button.dart';
import 'package:moto_mender/ui_layer/shared_components/text_field.dart';
import 'package:moto_mender/utils/view_models/add_category_view_model.dart';

import '../../../../../utils/base_states.dart';
import '../../../../../utils/dialog_utils.dart';
import '../../../../../utils/view_models/get_categories_view_model.dart';

class AddCategoryBottomSheet extends StatelessWidget {
  final GetCategoriesViewModel? getViewModel;

  const AddCategoryBottomSheet({super.key, this.getViewModel});

  static AddCategoryViewModel viewModel = AddCategoryViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Category",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: BlocListener(
        listener: (_, state) {
          if (state is BaseLoadingState) {
            showLoading(context);
          } else if (state is BaseErrorState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ));
          } else if (state is AddCategorySuccess) {
            Navigator.pop(context);
            Navigator.pop(context);
            getViewModel?.getCategories();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message), backgroundColor: Colors.green));
          }
        },
        bloc: viewModel,
        child: Form(
          key: viewModel.formKey,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CustomTextField(
                    validator: (name) {
                      if(name!.isEmpty) {
                        return "Required";
                      }
                      return null;
                    },
                      controller: viewModel.name,
                      hintText: "",
                      title: "Category Name"),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomButton(
                    title: "Save Category",
                    onPressed: () {
                      viewModel.addCategory();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
