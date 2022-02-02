import 'package:flutter/cupertino.dart';

class BottomCookieTypeProvider extends ChangeNotifier {
  List<String> cookieTypes = _Types().types;
  List<bool> isSelecteds =
      List.generate(_Types().types.length, (index) => false);

  selectedChanger(int v) {
    isSelecteds = List.generate(
      _Types().types.length,
      (index) => index == v ? true : false,
    );
    notifyListeners();
  }

  int orderQuantity = 1;
}

class _Types {
  List<String> types = [
    "Chocolate Chip",
    "Cookies and Cream",
    "Funfetti",
    "M and M",
    "Red Velvet",
    "Peanut Butter",
    "Snickerdoole",
    "White Chocolate Macadamia",
  ];
}
