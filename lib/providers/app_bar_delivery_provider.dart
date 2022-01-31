import 'package:flutter/cupertino.dart';

class AppBarDeliveryToProvider extends ChangeNotifier {
  String value = "Chilonzor";
  valueChanger(String v) {
    value = v;
    notifyListeners();
  }

  List<String> regions = [
    "Chilonzor",
    "Yunusobod",
    "Chirchiq",
    "Qoraqamish",
    "Sirg'ali",
    "Qibray",
    "G'azalkent",
    "Chorsu",
  ];
}
