import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/views/widgets/filter_button.dart';
import 'package:foodly/views/widgets/page_view_builder_page.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  int activeIndex = 0;


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getH(24.0)),
              Padding(
                padding: EdgeInsets.only(left: getW(20.0)),
                child: Text(
                  "80 Results found",
                  style: TextStyle(
                      fontSize: getH(20.0),
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              _listOfRestaurants(height, width),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      shape: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.inputFillColor,
          width: getW(
            1.0,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back_ios,
          size: getW(22.0),
          color: Colors.black,
        ),
      ),
      title: Text(
        "Burger",
        style: TextStyle(
          color: Colors.black,
          fontSize: getW(16.0),
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: const [
        FilterButton(),
      ],
    );
  }

  SizedBox _listOfRestaurants(double height, double width) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const PageViewBuilderWidget();
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
              image: AssetImage("assets/images/dish5.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

 
}
