import 'package:flutter/material.dart';
import 'package:foodly/views/screens/home_pages/home_v1_page.dart';

class RouteManager {
  static generaRouter(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePageV1());
      case '/filter':
        return MaterialPageRoute(builder: (_) => const HomePageV1());
      case '/search':
        return MaterialPageRoute(builder: (_) => const HomePageV1());
      case '/order':
        return MaterialPageRoute(builder: (_) => const HomePageV1());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const HomePageV1());
       // case '/dropDownButton':
      //   return MaterialPageRoute(builder: (_) => ());
    }
  }
}
