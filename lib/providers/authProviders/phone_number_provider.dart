import 'package:flutter/cupertino.dart';

class LoginByPhoneNumberProvider extends ChangeNotifier {
  int value = 0;
  valueChanger(v) {
    value = v;
    notifyListeners();
  }

  bool phoneNumberEntered = false;
  pageChanger(v) {
    phoneNumberEntered = v;
    notifyListeners();
  }
}
