import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/providers/page_view_provider.dart';
import 'package:foodly/views/widgets/dot.dart';
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
          _textMostPopular(),
          _listViewBuilderMostPopular(context),
        ],
      ),
    );
  }

  _listViewBuilderMostPopular(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getW(20.0)),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (_, __) {
            return _listViewBuilderMostPopularChildWidget();
          },
          separatorBuilder: (_, __) {
            return SizedBox(
              height: getH(41.0),
              width: getW(335.0),
              child: Divider(
                thickness: 1.0,
                color: AppColors.greyColor,
              ),
            );
          },
          itemCount: 30,
        ),
      ),
    );
  }

  SizedBox _listViewBuilderMostPopularChildWidget() {
    return SizedBox(
      height: getH(110.0),
      child: Row(
        children: [
          Ink(
            height: getH(110.0),
            width: getH(110.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getW(10.0)),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/dish5.jpeg"),
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            height: getH(110.0),
            width: getW(218.6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Combo Burger",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: getW(18.0),
                  ),
                ),
                SizedBox(
                  height: getH(8.0),
                ),
                Text(
                  "Shortbread, chocolate turtle",
                  style: TextStyle(
                    fontSize: getW(14.0),
                  ),
                ),
                SizedBox(height: getH(4.0)),
                Text(
                  "cookies, and red velvet.",
                  style: TextStyle(
                    fontSize: getW(14.0),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Row(
                  children: [
                    Text(
                      "\$\$",
                      style: TextStyle(
                        fontSize: getW(14.0),
                      ),
                    ),
                    SizedBox(width: getW(8.0)),
                    Dot(),
                    SizedBox(width: getW(8.0)),
                    Text(
                      "Chinese",
                      style: TextStyle(
                        fontSize: getW(14.0),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "USD7.4",
                      style: TextStyle(
                          color: AppColors.greenColor,
                          fontSize: getW(14.0),
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _textMostPopular() {
    return SliverToBoxAdapter(
      child: Text(
        "Most Populars",
        style: TextStyle(
          fontSize: getW(20.0),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  _mealTypes(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: getH(62.0),
        width: getW(375.0),
        child: ListView.builder(
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
    );
  }

  _featuredItems(BuildContext context) {
    return SliverToBoxAdapter(
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
