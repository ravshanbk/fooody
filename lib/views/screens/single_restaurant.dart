import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/providers/meal_type_provider.dart';
import 'package:foodly/providers/page_view_provider.dart';
import 'package:foodly/views/widgets/dot.dart';
import 'package:foodly/views/widgets/indicator_widget.dart';
import 'package:foodly/views/widgets/product_tile_widget.dart';
import 'package:foodly/views/widgets/single_child_restaurant_page_top_side_image_widget.dart';
import 'package:foodly/views/widgets/single_child_restoran_description.dart';
import 'package:provider/provider.dart';

class SingleRestaurantV1 extends StatelessWidget {
  const SingleRestaurantV1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _sliverAppBar(),
          _featuredItems(context),
          _mealTypes(context),
          _textCategory("Most Populars"),
          _listOfProducts(context),
          SliverToBoxAdapter(child: SizedBox(height: getH(30.0))),
          _textCategory("Sea Foods"),
          _listOfProducts(context),
          SliverToBoxAdapter(child: SizedBox(height: getH(30.0))),

        ],
      ),
    );
  }

  _listOfProducts(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getW(20.0)),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (_, __) {
            return _listViewBuilderMostPopularChildWidget(context);
          },
          separatorBuilder: (_, __) {
            return SizedBox(
              height: getH(41.0),
              width: getW(335.0),
              child: Divider(
                thickness: 2.0,
                color: AppColors.inputFillColor,
              ),
            );
          },
          itemCount: 4,
        ),
      ),
    );
  }

  _listViewBuilderMostPopularChildWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/addToOrder");
      },
      child:const ProductTile()
    );
  }

  _textCategory(title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: getW(20.0)),
        child: Text(
          title,
          style: TextStyle(
            fontSize: getW(20.0),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  _mealTypes(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: getH(24.0)),
        child: SizedBox(
          height: getH(62.0),
          width: getW(375.0),
          child: ListView.builder(
            padding: EdgeInsets.only(left: getW(20.0)),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: context.watch<MealTypeProvider>().types.length,
            itemBuilder: (_, __) {
              return TextButton(
                onPressed: () {
                  context.read<MealTypeProvider>().isSelectedChanger(__);
                },
                child: Text(
                  context.watch<MealTypeProvider>().types[__],
                  style: TextStyle(
                    fontSize: getW(24.0),
                    color: context.watch<MealTypeProvider>().isSelected[__]
                        ? Colors.black
                        : AppColors.greyColor,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  _featuredItems(BuildContext context) {
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/addToOrder");
        },
        child: SizedBox(
          height: getH(266.0),
          width: getW(375.0),
          child: Padding(
            padding: EdgeInsets.only(left: getW(20.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getH(20.0),
                ),
                Text(
                  "Featured Items",
                  style: TextStyle(
                    fontSize: getW(20.0),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: getH(18.0)),
                SizedBox(
                  height: getH(200.0),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (_, __) {
                      return SizedBox(
                        height: getH(200.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Ink(
                              height: getH(140.0),
                              width: getW(140.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    context
                                        .watch<PageViewProvider>()
                                        .imagePathes[2],
                                  ),
                                ),
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(
                                  getW(10.0),
                                ),
                              ),
                            ),
                            Text(
                              "Cookie Sandwich",
                              style: TextStyle(
                                fontSize: getW(16.0),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$\$",
                                  style: TextStyle(
                                    color: AppColors.greyColor,
                                    fontSize: getW(14.0),
                                  ),
                                ),
                                SizedBox(height: getW(8.0)),
                                Dot(),
                                SizedBox(height: getW(8.0)),
                                Text(
                                  "Chinese",
                                  style: TextStyle(
                                    fontSize: getW(14.0),
                                    color: AppColors.greyColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: getW(14.0));
                    },
                    itemCount:
                        context.watch<PageViewProvider>().imagePathes.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  SliverAppBar _sliverAppBar() {
    return SliverAppBar(
      stretch: true,
      floating: true,
      onStretchTrigger: () {
        debugPrint("Sliver app bar on Stretch triggered");
        throw ("sdff");
      },
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: getH(70.0),
      expandedHeight: getH(437.62),
      actions: [
        SvgPicture.asset(
          "assets/icons/share.svg",
          color: Colors.white,
          height: getH(29.0),
          width: getW(29.0),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: getW(29.0),
          ),
        ),
      ],
      leading: _leading(),
      flexibleSpace: FlexibleSpaceBar(
        background: _flexibleSpaceBar(),
        stretchModes: const <StretchMode>[
          StretchMode.fadeTitle,
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
        ],
      ),
    );
  }

  IconButton _leading() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  _flexibleSpaceBar() {
    return SizedBox(
      height: getH(467.0),
      width: getW(375.0),
      child: Column(
        children: [
          SizedBox(
            height: getH(280.0),
            width: getW(375.0),
            child: Stack(
              children: [
                const SingleRestaurantPageTopSideImageWidget(),
                Positioned(
                  child: const IndicatorWidget(),
                  bottom: getH(16.0),
                  right: getW(16.0),
                )
              ],
            ),
          ),
          SizedBox(
              height: getH(187.0),
              width: getW(375.0),
              child: const SingleChildRestaurantDescription())
        ],
      ),
    );
  }
}
