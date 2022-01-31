class FilterDataModel {
  List<String> categories;
  List<bool> selectedCategories;
  Function(int) func;
  FilterDataModel({
    required this.categories,
    required this.selectedCategories,
    required this.func,
  });
}
