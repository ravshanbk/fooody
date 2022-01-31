import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';

class Text16Grey extends StatelessWidget {
  final String title;
  const Text16Grey(this.title,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.greyColor,
        fontSize: getW(16.0),
      ),
    );
  }
}
