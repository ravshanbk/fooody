import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/models/filter_model.dart';

class FilterPageWrapWidget extends StatelessWidget {
  final FilterDataModel data;
  const FilterPageWrapWidget({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = List.generate(
      data.categories.length,
      (index) => Chip(
        elevation: 0,
        backgroundColor: data.selectedCategories[index]
            ? AppColors.greenColor
            : AppColors.inputFillColor,
        deleteIconColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getW(10.0),
          ),
        ),
       
        onDeleted: () {
          data.func(index);
        },
        label: Text(
          data.categories[index],
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: getW(12.0),
            color: data.selectedCategories[index]
                ? Colors.white
                : AppColors.greyColor,
          ),
        ),
      ),
    );

    SizeConfig().init(context);
    return Wrap(
      clipBehavior: Clip.hardEdge,
      runSpacing: 0.0,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: getW(12.0),
      children: _children,
      crossAxisAlignment: WrapCrossAlignment.start,
      direction: Axis.horizontal,
    );
  }
}
