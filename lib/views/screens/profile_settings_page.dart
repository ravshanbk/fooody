import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/core/constants/app_icons.dart';
import 'package:foodly/providers/bottom_navigation_bar_provider.dart/bottom_navigation_bar_provider.dart';
import 'package:foodly/providers/settingsProvider.dart';
import 'package:foodly/views/widgets/personal_info_widget.dart';
import 'package:foodly/views/widgets/what_todo_info_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingsProvider = context.watch<SettingsProvider>();
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getW(20.0)),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getH(20.0)),
                _whatTodo(),
                SizedBox(height: getH(24.0)),
                _settingItemsList(settingsProvider),
                SizedBox(height: getH(23.0)),
                _textNotifications(),
                SizedBox(height: getH(12.0)),
                _notificationsItemsList(settingsProvider, context),
                _textMore(),
                _moreItemsList(settingsProvider, context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _moreItemsList(
      SettingsProvider settingsProvider, BuildContext context) {
    return Column(
      children: [
        PersonalInfo(
          iconColor: AppColors.greenColor,
          icon: settingsProvider.moreItems[0][0],
          title: settingsProvider.moreItems[0][1],
          subtitle: settingsProvider.moreItems[0][2],
          tralingIcon: _forwardArrowIcon(),
        ),
        PersonalInfo(
          icon: settingsProvider.moreItems[1][0],
          title: settingsProvider.moreItems[1][1],
          subtitle: settingsProvider.moreItems[1][2],
          tralingIcon: _forwardArrowIcon(),
        ),
        SizedBox(height: getH(20.0)),
        PersonalInfo(
          onTap: () async {
            await GetStorage().write("token", "");
            Navigator.pushNamedAndRemoveUntil(
                context, "/signIn", (route) => false);
            context.read<BottomNavigationBarProvider>().changeCurrentIndex(0);
          },
          icon: settingsProvider.moreItems[2][0],
          title: settingsProvider.moreItems[2][1],
          tralingIcon: _forwardArrowIcon(),
        ),
      ],
    );
  }

  Text _textMore() {
    return Text(
      "MORE",
      style: TextStyle(
        color: AppColors.sharpGreyColor,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
    );
  }

  ListView _notificationsItemsList(
      SettingsProvider settingsProvider, BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: settingsProvider.notificationsValues.length,
        itemBuilder: (_, __) {
          return PersonalInfo(
            icon: APPIcons.notify,
            title: settingsProvider.notificationItems[__],
            subtitle: "For daily update you will get it",
            tralingIcon: CupertinoSwitch(
              onChanged: (v) {
                context.read<SettingsProvider>().switcher(__, v);
              },
              value: context.read<SettingsProvider>().notificationsValues[__],
            ),
          );
        });
  }

  Text _textNotifications() {
    return Text(
      "NOTIFICATIONS",
      style: TextStyle(
        color: AppColors.sharpGreyColor,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
    );
  }

  ListView _settingItemsList(settingsProvider) {
    return ListView.builder(
      itemCount: settingsProvider.settingItems.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, __) {
        return PersonalInfo(
          icon: settingsProvider.settingItems[__][0],
          title: settingsProvider.settingItems[__][1],
          subtitle: settingsProvider.settingItems[__][2],
          tralingIcon: _forwardArrowIcon(),
        );
      },
    );
  }

  SvgPicture _forwardArrowIcon() {
    return SvgPicture.asset(
      APPIcons.forward,
      color: AppColors.sharpGreyColor,
    );
  }

  WhatToDoInfoPage _whatTodo() {
    return WhatToDoInfoPage(
        title: "Account Settings",
        subTitle: "Update your settings like notifications,",
        subTitle2: " payments, profile edit etc.");
  }
}
