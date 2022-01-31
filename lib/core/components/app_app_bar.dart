import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/core/constants/app_icons.dart';
import 'package:foodly/providers/app_bar_delivery_provider.dart';
import 'package:provider/provider.dart';

appBarView(BuildContext? context, String? text, String? text2) {

  SizeConfig().init(context!);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: SvgPicture.asset(APPIcons.back),
      ),
      Text(
        "$text",
        style: TextStyle(
            fontSize: getH(16.0),
            color: AppColors.blackColor,
            fontWeight: FontWeight.w600),
      ),
      Text(
        "$text2",
        style: TextStyle(fontSize: getH(16.0)),
      ),
    ],
  );
}

appBarDeliveryTo(BuildContext context, Function func) {
  
  List<DropdownMenuItem<String>> _dropDownItems = List.generate(
    context.watch<AppBarDeliveryToProvider>().regions.length,
    (__) => DropdownMenuItem(
      value: context.watch<AppBarDeliveryToProvider>().regions[__],
      child: Text(
        context.watch<AppBarDeliveryToProvider>().regions[__],
        style: TextStyle(
          fontSize: getW(22.0),
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );

  return AppBar(
    centerTitle: true,
    toolbarHeight: getH(90.0),
    backgroundColor: Colors.white,
    elevation: 0,
    title: _titlee(context, _dropDownItems),
    actions: [
      TextButton(
        onPressed: () {
          func();
        },
        child: Text(
          "Filter",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: getW(16.0),
          ),
        ),
      ),
    ],
  );
}

Column _titlee(
    BuildContext context, List<DropdownMenuItem<String>> _dropDownItems) {
      
  return Column(
    children: [
      Text(
        "DELIVERY",
        style: TextStyle(
          color: AppColors.greenColor,
          fontSize: getW(12.0),
        ),
      ),
      DropdownButton<String>(
        icon: Icon(
          Icons.expand_more,
          size: getW(28.0),
        ),
        underline: Ink(
          color: Colors.white,
        ),
        value: context.watch<AppBarDeliveryToProvider>().value,
        items: _dropDownItems,
        onChanged: (v) {
          context.read<AppBarDeliveryToProvider>().valueChanger(v!);
        },
      ),
    ],
  );
}
