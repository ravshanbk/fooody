import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/views/screens/search_results_page.dart';
import 'package:foodly/views/widgets/dot.dart';

class SearchRestaurantPage extends StatelessWidget {
  const SearchRestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _sliverAppBar(),
          _textTopRestaurants(),
          SliverToBoxAdapter(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: getW(20.0),
                vertical: getH(20.0),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: getW(15.0),
                mainAxisSpacing: getH(16.0),
                crossAxisCount: 2,
                mainAxisExtent: getH(190.0),
              ),
              shrinkWrap: true,
              itemCount: 50,
              itemBuilder: (_, __) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>const SearchResults(),
                      ),
                    );
                  },
                  child: _gridViewChild(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _gridViewChild() {
    return SizedBox(
      width: getW(160.0),
      height: getH(198.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Ink(
            height: getH(140.0),
            width: getW(160.0),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/dish3.jpeg"),
                fit: BoxFit.cover,
              ),
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(
                getW(10.0),
              ),
            ),
          ),
          Text(
            "The Halal Guys",
            style: TextStyle(
              fontSize: getW(16.0),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: getH(20.0),
            width: getW(160.0),
            child: Row(
              children: [
                Text(
                  "\$\$",
                  style: TextStyle(
                    fontSize: getW(14.0),
                    color: AppColors.greyColor,
                  ),
                ),
                Dot(),
                Text(
                  "Chinese",
                  style: TextStyle(
                    fontSize: getW(14.0),
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _textTopRestaurants() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: getW(20.0),
        ),
        child: Text(
          "Top Restaurants",
          style: TextStyle(
            fontSize: getW(16.0),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  SliverAppBar _sliverAppBar() {
    return SliverAppBar(
      floating: true,
      snap: true,
      toolbarHeight: getH(90.0),
      expandedHeight: getH(180.0),
      flexibleSpace: _flexibleSpaceBar(),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: getW(335.0),
      leading: Padding(
        padding: EdgeInsets.only(
          left: getW(20.0),
          top: getH(30.0),
        ),
        child: Text(
          "Search",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: getW(28.0),
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

  FlexibleSpaceBar _flexibleSpaceBar() {
    return FlexibleSpaceBar(
      background: Container(
        color: Colors.white,
        alignment: const Alignment(0.0, 0.4),
        child: SizedBox(
          height: getH(48.0),
          width: getW(335.0),
          child: TextField(
            decoration: InputDecoration(
              isDense: true,
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.greyColor,
              ),
              hintText: "Search on foodly",
              hintStyle: TextStyle(fontSize: getW(16.0)),
              fillColor: AppColors.inputFillColor,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  getW(10.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
