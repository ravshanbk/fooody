import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';

class SeeAllButtonInRowWithTitle extends StatelessWidget {
  final String title;
  const SeeAllButtonInRowWithTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getW(20.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: getW(24.0), fontWeight: FontWeight.w600),
          ),
          TextButton(
            onPressed: () {
              switch (title) {
                case "Featured Partners":
                  Navigator.pushNamed(
                    context,
                   "/featuredPartners"
                  );
                  break;
                case "Best Picks\nRestaurant by team":
                 Navigator.pushNamed(
                    context,
                    "/searchRestaurantsPage"
                  );
                  break;
                   case "All Restaurants":
                 Navigator.pushNamed(
                    context,
                   "/home3"
                  );
                  break;
                default:
                  throw Exception("Routing Exeption From See All Button");
              }
            },
            child: Text(
              "See all",
              style: TextStyle(
                color: AppColors.greenColor,
                fontSize: getW(16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
