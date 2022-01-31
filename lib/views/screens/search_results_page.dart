import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodly/core/components/app_app_bar.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class SearchResults extends StatefulWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  int activeIndex = 0;

  final urlImages = ["2", "2", "2", "asd", 'As'];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getW(20.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBarView(context, "Burger", ""),
              SizedBox(
                height: getH(1.0),
                child: Divider(
                  thickness: getH(.6),
                  color: AppColors.greyColor,
                ),
              ),
              SizedBox(height: getH(24.0)),
              Text(
                "80 Results found",
                style: TextStyle(
                    fontSize: getH(20.0),
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w500),
              ),
              _listOfRestaurants(height, width),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _listOfRestaurants(double height, double width) {
    return SizedBox(
              height: height - getH(153.0),
              width: width,
              child: ListView.builder(
                itemCount: 4,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: getH(20.0)),
                      Stack(
                        children: [
                          SizedBox(
                            height: getH(185.0),
                            width: width,
                            child: CarouselSlider.builder(
                              options: CarouselOptions(
                                  viewportFraction: 1,
                                  height: 400.0,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      activeIndex = index;
                                    });
                                  }),
                              itemCount: urlImages.length,
                              itemBuilder: (context, index, realIndex) {
                                final urlImage = urlImages[index];
                                return buildImage(urlImage, index);
                              },
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 20,
                            child: buildIndecator(),
                          )
                        ],
                      ),
                      SizedBox(height: getH(16.0)),
                      Text(
                        "McDonald's",
                        style: TextStyle(
                            fontSize: getH(20.0),
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: getH(4.0)),
                      Text(
                        "\$\$  Chinese  American  Deshi food",
                        style: TextStyle(
                            fontSize: 16.0, color: AppColors.greyColor),
                      ),
                      SizedBox(height: getH(9.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("4.3"),
                          SvgPicture.asset(
                              "assets/images/32-Search results-Card-Card-icon-24-icon-24-rating.svg"),
                          const Text("200+ Ratings"),
                          SvgPicture.asset(
                              "assets/images/32-Search results-Card-Card-icon-24-icon-24-clock.svg"),
                          const Text("25 Min"),
                          SvgPicture.asset(
                              "assets/images/32-Search results-Card-Card-icon-25-icon-25-delivery.svg"),
                          const Text("Free"),
                          SizedBox(width: getW(55.0))
                        ],
                      ),
                    ],
                  );
                },
              ),
            );
  }

  buildImage(String urlImage, int index) => Positioned(
        child: Container(
          height: getH(185.0),
          margin: const EdgeInsets.all(4),
          width: getW(335.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image: const DecorationImage(
              image: AssetImage(
                  "assets/images/dish5.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  buildIndecator() => AnimatedSmoothIndicator(
        effect: WormEffect(
            dotColor: Colors.white.withOpacity(0.3),
            dotHeight: getH(5.0),
            dotWidth: getW(8.0),
            activeDotColor: Colors.white),
        activeIndex: activeIndex,
        count: urlImages.length,
      );
}
