import 'package:flutter/material.dart';


class TabsProvider extends ChangeNotifier {
  List tabs = const [];
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
