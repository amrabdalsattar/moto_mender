import 'package:flutter/material.dart';

import '../../ui_layer/user_view/tabs/favourites_tab/favourites_tab.dart';
import '../../ui_layer/user_view/tabs/home_tab/home_tab.dart';
import '../../ui_layer/user_view/tabs/profile_tab/profile_tab.dart';
import '../../ui_layer/user_view/tabs/search_tab/search_tab.dart';

class TabsProvider extends ChangeNotifier {
  List tabs = const [HomeTab(), SearchTab(), FavouritesTab(), ProfileTab()];
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
