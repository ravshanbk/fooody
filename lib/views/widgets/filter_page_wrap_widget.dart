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
      (index) => ElevatedButton(
        onPressed: () {
          data.func(index);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(getW(80.0), getH(38.0)),
          padding: EdgeInsets.symmetric(
            horizontal: getW(20.0),
          ),
          primary: data.selectedCategories[index]
              ? AppColors.greenColor
              : AppColors.inputFillColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(
              getW(10.0),
            ),
          ),
        ),
        child: Text(
          data.categories[index],
          style: TextStyle(
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
      spacing: getW(12.0),
      children: _children,
      crossAxisAlignment: WrapCrossAlignment.start,
      direction: Axis.horizontal,
    );
  }
}
