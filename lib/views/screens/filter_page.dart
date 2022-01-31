import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/models/filter_model.dart';
import 'package:foodly/providers/filter_provider.dart';
import 'package:foodly/views/widgets/filter_page_wrap_widget.dart';
import 'package:foodly/views/widgets/green_primary_colered_button.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: _appBar(context),
      body: Column(
        children: [
          _clearAllButtonWithTitle("CATEGORIES", context),
          _categoriesWrap(context),
          SizedBox(height: getH(34.0)),
          _clearAllButtonWithTitle("DIETARY", context),
          _dietaryWrap(context),
          SizedBox(height: getH(34.0)),
          _clearAllButtonWithTitle("PRICE RANGE", context),
          _priceRange(context),
          const Spacer(),
          ButtonGreenPrimearyColored(
              onPressed: () {
                if (kDebugMode) {
                  print("object Get Started Bosildi");
                }
              },
              title: "APPLY FILTERS"),
          SizedBox(height: getH(30.0)),
        ],
      ),
    );
  }

  SizedBox _priceRange(BuildContext context) {
    return SizedBox(
      height: getH(74.0),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: getW(20.0)),
        separatorBuilder: (_, __) {
          return SizedBox(width: getW(16.0));
        },
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: context.watch<FilterProvider>().priceRange.length,
        itemBuilder: (_, __) {
          return CircleAvatar(
            radius: getW(32.0),
            backgroundColor:
                context.watch<FilterProvider>().selectedPriceRange[__]
                    ? AppColors.greenColor
                    : AppColors.inputFillColor,
            child: InkWell(
              onTap: () {
                context.read<FilterProvider>().selectedPriceRangeChanger(__);
              },
              child: Text(
                context.watch<FilterProvider>().priceRange[__],
                style: TextStyle(
                  color: context.watch<FilterProvider>().selectedPriceRange[__]
                      ? Colors.white
                      : Colors.black,
                  fontSize: getW(16.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  FilterPageWrapWidget _dietaryWrap(BuildContext context) {
    return FilterPageWrapWidget(
      data: FilterDataModel(
        categories: context.watch<FilterProvider>().dietary,
        selectedCategories: context.watch<FilterProvider>().selectedDietary,
        func: context.read<FilterProvider>().selectedDietaryChanger,
      ),
    );
  }

  FilterPageWrapWidget _categoriesWrap(BuildContext context) {
    return FilterPageWrapWidget(
      data: FilterDataModel(
        categories: context.read<FilterProvider>().categories,
        selectedCategories: context.watch<FilterProvider>().selectedCategory,
        func: context.read<FilterProvider>().selectedCategoryChanger,
      ),
    );
  }

  _clearAllButtonWithTitle(String title, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getW(20.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: getW(16.0),
              fontWeight: FontWeight.w600,
            ),
          ),
          TextButton(
            onPressed: () {
              switch (title) {
                case "CATEGORIES":
                  context.read<FilterProvider>().selectedCategoryChanger(0);

                  break;
                case "DIETARY":
                  context.read<FilterProvider>().selectedDietaryChanger(0);

                  break;
                case "PRICE RANGE":
                  context.read<FilterProvider>().selectedPriceRangeChanger(10);

                  break;
                default:
              }
            },
            child: Text(
              "CLEAR ALL",
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: getW(12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: getW(18.0),
        ),
      ),
      title: Text(
        "Filters",
        style: TextStyle(
          color: Colors.black,
          fontSize: getW(16.0),
        ),
      ),
    );
  }
}
