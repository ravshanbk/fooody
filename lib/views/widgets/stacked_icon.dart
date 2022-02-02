import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';

class StackedIcon extends StatelessWidget {
  final IconData icon;
  const StackedIcon({required this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getH(33.0),
      width: getH(33.0),
      child: Stack(
        children: [
          SvgPicture.asset("assets/icons/Active.svg",fit: BoxFit.cover,),
          Align(alignment:const  Alignment(-0.5,-0.2),child: Icon(icon, color: AppColors.greenColor, size: getW(16.0))),
        ],
      ),
    );
  }
}
