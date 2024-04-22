import 'package:flutter/material.dart';

import '../../ui_layer/tabs/favourites_tab/favourites_tab.dart';
import '../../ui_layer/tabs/home_tab/home_tab.dart';
import '../../ui_layer/tabs/profile_tab/profile_tab.dart';
import '../../ui_layer/tabs/search_tab/search_tab.dart';

class TabsProvider extends ChangeNotifier {
  List tabs = const [HomeTab(), SearchTab(), FavouritesTab(), ProfileTab()];
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
