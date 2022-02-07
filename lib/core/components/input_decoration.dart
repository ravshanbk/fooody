import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';

inputDecorationMy({
  hintText,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    hintStyle: TextStyle(
      color: AppColors.greyColor,
    ),
    hintText: hintText,
    suffixIcon: suffixIcon ??
        const SizedBox(
          height: 0,
          width: 0,
        ),
    fillColor: AppColors.inputFillColor,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(
        getW(10.0),
      ),
    ),
  );
}
