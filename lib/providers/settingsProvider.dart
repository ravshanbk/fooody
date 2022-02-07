import 'package:flutter/material.dart';
import 'package:foodly/core/constants/app_icons.dart';

class SettingsProvider extends ChangeNotifier {
  List settingItems = SubClassOfSettingsProvider().settingItems;
   List moreItems = [
    [
      APPIcons.rating,
      "Rate Us",
      "Rate us playstore, appstor",
    ],
    [
      APPIcons.document,
      "FAQ",
      "Frequently asked questions",
    ],
    [
      APPIcons.logout,
      "Logout",
      
    ],
  ];
  List<String> notificationItems =
      SubClassOfSettingsProvider().notificationItems;
  List<bool> notificationsValues = List.generate(
    SubClassOfSettingsProvider().notificationItems.length,
    (index) => false,
  );
  switcher(int v, bool idf) {
    notificationsValues[v] = idf;
    notifyListeners();
  }
}

class SubClassOfSettingsProvider {
  List<String> notificationItems = [
    "Push Notifications",
    "SMS Notifications",
    "Promotional Notifications",
  ];
  List<List<dynamic>> settingItems = [
    [
      APPIcons.profile,
      "Profile Information",
      "Change your account information",
    ],
    [
      APPIcons.lock,
      "Change Password",
      "Change your password",
    ],
    [
      APPIcons.card,
      "Payment Methods",
      "Add your credit & debit cards",
    ],
    [
      APPIcons.location,
      "Locations",
      "Add or remove your delivery locations",
    ],
    [
      APPIcons.facebook,
      "Add Social Account",
      "Add Facebook, Twitter etc ",
    ],
    [
      APPIcons.share,
      "Refer to Friends",
      "Get \$10 for reffering friends",
    ],
  ];


}
