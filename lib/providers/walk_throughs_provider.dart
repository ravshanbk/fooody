import 'package:flutter/material.dart';
import 'package:foodly/core/constants/app_colors.dart';

class WalkThroughPageProvider extends ChangeNotifier {
  final PageController controller = PageController(
    initialPage: 0,
  );

  List indicatorColors = List.generate(3,
      (index) => index == 0 ? AppColors.greenColor : AppColors.halfGreyColor);

  indicatorColorChanger(int v) {
    indicatorColors = List.generate(
      3,
      (index) => index == v ? AppColors.greenColor : AppColors.halfGreyColor,
    );
    notifyListeners();
  }

  List<String> titles = [
    "All your favorites",
    "Free delivery offers",
    "Choose your food"
  ];
  List<String> imagePaths = [
    "All your favorites",
    "Free delivery offers",
    "Choose your food"
  ];
  List<List<String>> subTitles = [
    [
      "Order from the best local restaurants",
      "with easy, on-demand delivery.",
    ],
    [
      "Free delivery for new customers via Apple",
      "Pay and others payment methods.",
    ],
    [
      "Easily find your type of food craving and",
      "you'll get delivery in wide range.",
    ],
  ];
}
