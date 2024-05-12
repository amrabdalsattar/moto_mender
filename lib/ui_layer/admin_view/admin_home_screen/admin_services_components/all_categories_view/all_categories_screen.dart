import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender/ui_layer/admin_view/admin_home_screen/admin_services_components/all_categories_view/add_category_bottom_sheet.dart';
import 'package:moto_mender/ui_layer/admin_view/admin_home_screen/admin_services_components/all_categories_view/screen_content.dart';
import 'package:moto_mender/ui_layer/shared_components/loading.dart';
import 'package:moto_mender/utils/app_colors.dart';
import 'package:moto_mender/utils/view_models/get_categories_view_model.dart';

class AllCategoriesScreen extends StatefulWidget {
  static const routeName = "categoriesScreen";
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  GetCategoriesViewModel viewModel = GetCategoriesViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "categories",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: BlocBuilder<GetCategoriesViewModel, CategoriesStates>(
          bloc: viewModel,
          builder: (_, state) {
            Widget screenContent;
            if (state is GetCategoriesLoadingState) {
              screenContent = const Loading();
            } else if (state is GetCategoriesSuccessState) {
              screenContent = ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) =>
                      ScreenContent(category: state.categories[index]));
            } else {
              state as GetCategoriesErrorState;
              screenContent = Text(state.error);
            }
            return screenContent;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, builder: (_) =>
              AddCategoryBottomSheet(getViewModel: viewModel,)
          );
        },
        backgroundColor: AppColors.primary,
        child: const Icon(CupertinoIcons.plus),
      ),
    );
  }
}
