import 'package:flutter/material.dart';
import 'package:foodly/views/screens/featured_partners_page.dart';
import 'package:foodly/views/screens/filter_page.dart';
import 'package:foodly/views/screens/home_pages/home_v1_page.dart';
import 'package:foodly/views/screens/search_restaurant_page.dart';
import 'package:foodly/views/screens/search_results_page.dart';

class RouteManager {
  static generaRouter(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePageV1());
      case '/filter':
        return MaterialPageRoute(builder: (_) => const FilterPage());
      case "/searchResults":
        return MaterialPageRoute(builder: (_) => const SearchResults());
      case "/featuredPartners":
        return MaterialPageRoute(builder: (_) => const FeaturedPartners());
      case "/searchRestaurantsPage":
        return MaterialPageRoute(builder: (_) => const SearchRestaurantPage());
        case "/searchRestaudrantsPage":
        return MaterialPageRoute(builder: (_) => const SearchRestaurantPage());
    
      // case '/dropDownButton':
      //   return MaterialPageRoute(builder: (_) => ());
    }
  }
}
