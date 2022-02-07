import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/providers/app_bar_delivery_provider.dart';
import 'package:foodly/providers/bottom_navigation_bar_provider.dart/bottom_navigation_bar_provider.dart';
import 'package:foodly/views/screens/home_pages/home_v1_page.dart';
import 'package:foodly/views/screens/profile_settings_page.dart';
import 'package:foodly/views/screens/search_restaurant_page.dart';
import 'package:foodly/views/screens/your_imaged_orders_page.dart';
import 'package:foodly/views/widgets/filter_button.dart';
import 'package:provider/provider.dart';

class BodyPage extends StatelessWidget {
  const BodyPage({Key? key}) : super(key: key);

  final List<String> bottomNavBarIcons = const [
    "assets/icons/home.svg",
    "assets/icons/search.svg",
    "assets/icons/order.svg",
    "assets/icons/profile.svg",
  ];
  final List<String> bottomNavBarLabels = const [
    "Home",
    "Search",
    "Orders",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> bodies = [
      const HomePageV1(),
      const SearchRestaurantPage(),
      const YourImagedOrders(),
      const AccountSettingsPage(),
    ];
    final List<BottomNavigationBarItem> bottomNavBarItems =
        List.generate(bodies.length, (index) {
      return BottomNavigationBarItem(
        label: bottomNavBarLabels[index],
        icon: SvgPicture.asset(
          bottomNavBarIcons[index],
          color:
              context.watch<BottomNavigationBarProvider>().currentIndex == index
                  ? AppColors.greenColor
                  : AppColors.greyColor,
        ),
      );
    });
    SizeConfig().init(context);
    return Scaffold(
        bottomNavigationBar: _bottomNavBar(context, bottomNavBarItems),
        body:
            bodies[context.watch<BottomNavigationBarProvider>().currentIndex]);
  }

  BottomNavigationBar _bottomNavBar(
      BuildContext context, List<BottomNavigationBarItem> bottomNavBarItems) {
    return BottomNavigationBar(
      onTap: (v) {
        context.read<BottomNavigationBarProvider>().changeCurrentIndex(v);
      },
      selectedIconTheme: IconThemeData(color: AppColors.greenColor),
      selectedItemColor: AppColors.greenColor,
      currentIndex: context.watch<BottomNavigationBarProvider>().currentIndex,
      items: bottomNavBarItems,
    );
  }
}
