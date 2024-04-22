import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moto_mender/ui_layer/screens/home_screen/home_screen_components/custom_app_bar.dart';
import 'package:moto_mender/ui_layer/screens/home_screen/home_screen_components/custom_bottom_navigation_bar.dart';
import 'package:moto_mender/utils/providers/tabs_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TabsProvider(),
      child: Consumer<TabsProvider>(
        builder:(__, viewModel, _) => Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: const CustomAppBar(),
          ),
          body: viewModel.tabs[viewModel.currentIndex],
          bottomNavigationBar: CustomBottomNavigationBar(viewModel: viewModel,),
        ),
      ),
    );
  }
}
