import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (kDebugMode) {
          print("sdfs");
        }
        Navigator.pushNamed(
          context,
          "/filter",
        );
      },
      child: Text(
        "Filter",
        style: TextStyle(
          color: AppColors.greyColor,
          fontWeight: FontWeight.w500,
          fontSize: getW(16.0),
        ),
      ),
    );
  }
}
