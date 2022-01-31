import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  List<String> categories = _FilterProviderData().categories;
  List<String> dietary = _FilterProviderData().dietary;
  List<String> priceRange = _FilterProviderData().priceRange;

  List<bool> selectedCategory = List.generate(
    _FilterProviderData().categories.length,
    (index) => index == 0 ? true : false,
  );

  selectedCategoryChanger(int v) {
    selectedCategory = List.generate(
      _FilterProviderData().categories.length,
      (index) => index == v ? true : false,
    );
    notifyListeners();
  }

  List<bool> selectedDietary = List.generate(
    _FilterProviderData().dietary.length,
    (index) => index == 0 ? true : false,
  );

  selectedDietaryChanger(int v) {
    selectedDietary = List.generate(
      _FilterProviderData().dietary.length,
      (index) => index == v ? true : false,
    );
    notifyListeners();
  }

  List<bool> selectedPriceRange = List.generate(
    _FilterProviderData().priceRange.length,
    (index) => index == 1 ? true : false,
  );

  selectedPriceRangeChanger(int v) {
    selectedPriceRange = List.generate(
      _FilterProviderData().priceRange.length,
      (index) => index == v ? true : false,
    );
    notifyListeners();
  }
}

class _FilterProviderData {
  List<String> categories = [
    "ALL",
    "BRUNCH",
    "DINNER",
    "BURGERS",
    "CHINESE",
    "PIZZA",
    "SALADS",
    "SOUPS",
    "BREAKFAST"
  ];
  List<String> dietary = [
    "ANY",
    "VEGETARIAN",
    "VEGAN",
    "GLUTEN-FREE",
  ];
  List<String> priceRange = [
    "<\$10",
    "\$10-\$30",
    "\$30-\$60",
    "\$60-100",
    "\$100+",
  ];
}
