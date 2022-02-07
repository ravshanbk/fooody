import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';

// ignore: must_be_immutable
class WhatToDoInfoPage extends StatelessWidget {
  final String title;
  final String subTitle;
  final String subTitle2;
  Function? onPressed;
  String? textButtonText;
  bool? isCentered;
  WhatToDoInfoPage({
    required this.title,
    required this.subTitle,
    required this.subTitle2,
    this.onPressed,
    this.textButtonText,
    this.isCentered,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isCentered != null
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        _textTitle(),
        SizedBox(height: getH(15.0)),
        _textSubtitle(),
        SizedBox(
          height: getH(8.0),
        ),
        _textSubtitle2(),
      ],
    );
  }

  _textSubtitle2() {
    return isCentered != null
        ? Text(
            subTitle2,
            style: TextStyle(
              color: AppColors.greyColor,
            ),
          )
        : Row(
            children: [
              Text(
                subTitle2,
                style: TextStyle(
                  color: AppColors.greyColor,
                ),
              ),
              SizedBox(
                height: getH(25.0),
              ),
              textButtonText != null
                  ? TextButton(
                      onPressed: () {
                        onPressed!();
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0.0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        textButtonText!,
                        style: TextStyle(color: AppColors.greenColor),
                      ),
                    )
                  : const SizedBox(
                      height: 0.0,
                      width: 0.0,
                    ),
            ],
          );
  }

  Text _textSubtitle() {
    return Text(
      subTitle,
      style: TextStyle(
        color: AppColors.greyColor,
      ),
    );
  }

  Text _textTitle() {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontSize: getW(isCentered != null ? 21.0 : 34.0),
      ),
    );
  }
}
