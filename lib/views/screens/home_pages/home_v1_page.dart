import 'package:flutter/material.dart';
import 'package:foodly/core/components/app_app_bar.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/providers/page_view_provider.dart';
import 'package:foodly/views/screens/filter_page.dart';
import 'package:foodly/views/widgets/page_view_builder_page.dart';
import 'package:foodly/views/widgets/see_all_button_in_row_with_title.dart';
import 'package:provider/provider.dart';

class HomePageV1 extends StatelessWidget {
  const HomePageV1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: appBarDeliveryTo(
        context,
        () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FilterPage(),
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PageViewBuilderWidget(),
            SizedBox(height: getH(34.0)),
            const SeeAllButtonInRowWithTitle("Featured Partners"),
            SizedBox(height: getH(10.0)),
            _partnersImageBoxes(context),
            SizedBox(height: getH(34.0)),
            _freeDeliveryFor1MonthBanner(),
            SizedBox(height: getH(34.0)),
            const SeeAllButtonInRowWithTitle("Best Picks\nRestaurant by team"),
            SizedBox(height: getH(14.0)),
            _partnersImageBoxes(context),
            SizedBox(height: getH(34.0)),
            const SeeAllButtonInRowWithTitle("All Restaurants"),
            _listOfAllRestaurants(),
          ],
        ),
      ),
    );
  }

  ListView _listOfAllRestaurants() {
    return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, __) {
              return Column(
                children: [
                  const PageViewBuilderWidget(),
                  Text(__.toString())
                ],
              );
            },
          );
  }

  Ink _freeDeliveryFor1MonthBanner() {
    return Ink(
      height: getH(170.0),
      width: getW(335.0),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/freeDeliveryBanner.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(
          getW(15.0),
        ),
      ),
    );
  }

  SizedBox _partnersImageBoxes(BuildContext context) {
    
    return SizedBox(
      height: getH(254.0),
      child: ListView.separated(
        padding: EdgeInsets.only(
          left: getW(20.0),
        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imageBox(context, __),
              _whatIsThisText(),
              _textWhereIsThisFrom(),
              _ratingTimeAndFeeOfDelivery()
            ],
          );
        },
        separatorBuilder: (_, __) {
          return SizedBox(
            width: getW(14.0),
          );
        },
        itemCount: context.watch<PageViewProvider>().imagePathes.length,
      ),
    );
  }

  Row _ratingTimeAndFeeOfDelivery() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Ink(
          height: getH(20.0),
          width: getW(36.0),
          decoration: BoxDecoration(
            color: AppColors.greenColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            "4.5",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: getW(12.0),
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 6.0,
        ),
        Text(
          "25min",
          style: TextStyle(
            fontSize: getW(14.0),
            color: AppColors.greyColor,
          ),
        ),
        const SizedBox(
          width: 6.0,
        ),
        Icon(
          Icons.circle,
          size: 6,
          color: AppColors.greyColor,
        ),
        const SizedBox(
          width: 6.0,
        ),
        Text(
          "Free delivery",
          style: TextStyle(
            color: AppColors.greyColor,
            fontSize: getW(14.0),
          ),
        ),
      ],
    );
  }

  Text _textWhereIsThisFrom() {
    return Text(
      "Colarado, San Francisco",
      style: TextStyle(
        color: Colors.grey,
        fontSize: getW(16.0),
      ),
    );
  }

  Text _whatIsThisText() {
    return Text(
      "Daylight Coffee",
      style: TextStyle(
        fontSize: getW(20.0),
      ),
    );
  }

  Ink _imageBox(BuildContext context, int __) {
    
    
  
    return Ink(
      height: getH(160.0),
      width: getW(200.0),
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image:
                AssetImage(context.watch<PageViewProvider>().imagePathes[__])),
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(
          getW(15.0),
        ),
      ),
    );
  }
}
