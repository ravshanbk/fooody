import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';

class PersonalInfo extends StatelessWidget {
  PersonalInfo({
    Key? key,
    this.onTap,
    this.iconColor,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.tralingIcon,
  }) : super(
          key: key,
        );
  Function? onTap;
  Color? iconColor;
  String? icon;
  String? subtitle;
  String? title;
  Widget tralingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap!();
      },
      horizontalTitleGap: getW(1.0),
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(
        icon!,
        color: iconColor ?? AppColors.sharpGreyColor,
      ),
      title: Text(
        title!,
        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
      subtitle: subtitle != null
          ? Padding(
              padding: EdgeInsets.only(top: getH(5.0)),
              child: Text(
                subtitle!,
                style: const TextStyle(fontSize: 14.0),
              ),
            )
          : null,
      trailing: tralingIcon,
    );
  }
}
