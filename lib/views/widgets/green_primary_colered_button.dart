import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';

class ButtonGreenPrimearyColored extends StatelessWidget {
  final String title;
  final Function onPressed;
  const ButtonGreenPrimearyColored({
    required this.onPressed,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (kDebugMode) {
          print("Green button bosildi");
        }
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        fixedSize: Size(
          getW(335.0),
          getH(48.0),
        ),
        primary: AppColors.greenColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getW(10.0),
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: getW(14.0),
        ),
      ),
    );
  }
}
