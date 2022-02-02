import 'package:flutter/foundation.dart';

class TopCookieTypeProvider extends ChangeNotifier {
  List<String> cookieTypes = _Types().types;
  List<bool> isSelecteds =
      List.generate(_Types().types.length, (index) => false);

  selectedChanger(int v) {
    if (kDebugMode) {
      print("selectedChanger(v).toString()");
    }
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
