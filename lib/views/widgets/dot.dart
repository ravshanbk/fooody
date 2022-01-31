import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';

// ignore: must_be_immutable
class Dot extends StatelessWidget {
  Color? color;
  double? size;
  double? padding;

  Dot({this.size, this.color, this.padding, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getW(padding ?? 6.0)),
      child: Icon(
        Icons.circle,
        color: color ?? AppColors.greyColor,
        size: getW(size ?? 6),
      ),
    );
  }
}
