import 'package:flutter/material.dart';
import 'package:moto_mender/utils/app_assets.dart';
import 'package:moto_mender/utils/providers/tabs_provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final TabsProvider viewModel;
  const CustomBottomNavigationBar({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      currentIndex: viewModel.currentIndex,
      onTap: (index){
        viewModel.changeIndex(index);
      },
      items: [
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.home)), label: "Home"),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.search)), label: "Search"),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.favourites)),
            label: "Favourites"),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.profile)), label: "Profile"),
      ],
    );
  }
}
