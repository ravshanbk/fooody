import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';

class WithConnectButton extends StatelessWidget {
  final bool isFacebook;
  const WithConnectButton({
    required this.isFacebook,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: getW(16.0),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getW(10.0),
          ),
        ),
        fixedSize: Size(
          getW(335.0),
          getH(44.0),
        ),
        primary: isFacebook ? AppColors.deepBlueColor : AppColors.blueColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Ink(
            height: getH(28.0),
            width: getH(28.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                getW(7.0),
              ),
            ),
            child: SvgPicture.asset(
              isFacebook
                  ? "assets/icons/facebook.svg"
                  : "assets/icons/google.svg",
            ),
          ),
          Text(
            "CONNECT WITH" + (isFacebook ? "FACEBOOK" : "GOOGLE"),
            style: TextStyle(
              fontSize: getW(12.0),
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
