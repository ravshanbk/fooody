import 'package:flutter/cupertino.dart';

class MealTypeProvider extends ChangeNotifier {
  List<String> types = _Types().types;
  List<bool> isSelected = List.generate(
      _Types().types.length, (index) => index == 1 ? true : false);
  isSelectedChanger(int v) {
    isSelected = List.generate(
        _Types().types.length, (index) => index == v ? true : false);
    notifyListeners();
  }
}

class _Types {
  List<String> types = ["Chopp & Lamb", "SeaFood", "Apetizer", "Delishes"];
}
