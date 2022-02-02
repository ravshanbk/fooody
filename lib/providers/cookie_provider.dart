import 'package:flutter/cupertino.dart';

class CookieProvider extends ChangeNotifier {
  int quantity = 1;
  incrementQuantity(bool idf) {
    if (idf) {
      quantity += 1;
      notifyListeners();
    } else {
      if (quantity > 1) {
        quantity -= 1;
        notifyListeners();
      }
    }
  }
}
