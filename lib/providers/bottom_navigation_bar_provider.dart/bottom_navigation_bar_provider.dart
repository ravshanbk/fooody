import 'package:flutter/material.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int currentIndex = 0;
  changeCurrentIndex(v) {
    currentIndex = v;
    notifyListeners();
  }
}
