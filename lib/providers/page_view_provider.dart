import 'package:flutter/cupertino.dart';

class PageViewProvider extends ChangeNotifier {
  int currentPage = 0;
  currentPageChanger(v) {
    currentPage = v;
    notifyListeners();
  }

  List<String> imagePathes = [
    "assets/images/dish.jpeg",
    "assets/images/dish1.jpeg",
    "assets/images/dish2.jpeg",
    "assets/images/dish3.jpeg",
    "assets/images/dish4.jpeg",
    "assets/images/dish5.jpeg",
  ];
}
