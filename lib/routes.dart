import 'package:flutter/material.dart';
import 'package:foodly/views/screens/add_to_order.dart';
import 'package:foodly/views/screens/auth/sign_up_page.dart';
import 'package:foodly/views/screens/featured_partners_page.dart';
import 'package:foodly/views/screens/filter_page.dart';
import 'package:foodly/views/screens/home_pages/body_page.dart';
import 'package:foodly/views/screens/home_pages/home_v1_page.dart';
import 'package:foodly/views/screens/home_pages/home_v3_page.dart';
import 'package:foodly/views/screens/profile_settings_page.dart';
import 'package:foodly/views/screens/search_restaurant_page.dart';
import 'package:foodly/views/screens/search_results_page.dart';
import 'package:foodly/views/screens/auth/sign_in_page_v1.dart';
import 'package:foodly/views/screens/single_restaurant.dart';
import 'package:foodly/views/screens/walk_throughs_page.dart';
import 'package:foodly/views/screens/your_orders_page.dart';

class RouteManager {
  static generaRouter(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const WalkThroughs());

      case '/home':
        return MaterialPageRoute(builder: (_) =>  HomePageV1());
      case '/filter':
        return MaterialPageRoute(builder: (_) => const FilterPage());
      case "/searchResults":
        return MaterialPageRoute(builder: (_) => const SearchResults());
      case "/featuredPartners":
        return MaterialPageRoute(builder: (_) => const FeaturedPartners());
      case "/searchRestaurantsPage":
        return MaterialPageRoute(builder: (_) => const SearchRestaurantPage());
      case "/singleRestaurant":
        return MaterialPageRoute(builder: (_) => const SingleRestaurantV1());
      case "/yourOrders":
        return MaterialPageRoute(builder: (_) => const YourOrdersPage());
      case "/addToOrder":
        return MaterialPageRoute(builder: (_) => const AddToOrderPage());
      case "/home3":
        return MaterialPageRoute(builder: (_) => const HomePageV3());
      case "/signIn":
        return MaterialPageRoute(builder: (_) => SignInPageV1());
      case "/signUp":
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case "accountSettings":
        return MaterialPageRoute(builder: (_) =>const  AccountSettingsPage());
 case "/bodyPage":
        return MaterialPageRoute(builder: (_) =>const BodyPage());
  // case "/signIn":
      //   return MaterialPageRoute(builder: (_) => SignInPageV1());
    }
  }
}
