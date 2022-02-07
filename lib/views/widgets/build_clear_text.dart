import 'package:flutter/material.dart';
import 'package:foodly/core/constants/app_colors.dart';

Row clearAllTextButtonWithTitle(String title) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            color: AppColors.greyColor,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "CLEAR ALL",
            style: TextStyle(
                fontSize: 12.0,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
