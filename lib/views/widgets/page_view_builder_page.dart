import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/providers/page_view_provider.dart';
import 'package:foodly/views/widgets/dot.dart';
import 'package:foodly/views/widgets/text_widgets/text_12.dart';
import 'package:foodly/views/widgets/text_widgets/text_16_grey.dart';
import 'package:provider/provider.dart';

class PageViewBuilderWidget extends StatelessWidget {
  const PageViewBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    SizeConfig().init(context);
    return SizedBox(
    height: getH(326.0),
    width: getW(375.0),
    child: PageView.builder(
      onPageChanged: (v) {
        context.read<PageViewProvider>().currentPageChanger(v);
      },
      itemCount: context.watch<PageViewProvider>().imagePathes.length,
      itemBuilder: (_, __) {
        return _pageViewChild(context, __);
      },
    ),
    );
  }

  
  Padding _pageViewChild(BuildContext context, int __) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getW(20.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: getH(185.0),
            width: getW(335.0),
            alignment: const Alignment(0.85, 0.8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                getW(15.0),
              ),
              image: DecorationImage(
                  image: AssetImage(
                    context.watch<PageViewProvider>().imagePathes[__],
                  ),
                  fit: BoxFit.cover),
            ),
            child: _indicator(context),
          ),
          Text(
            "McDonald's",
            style: TextStyle(
              fontSize: getW(20.0),
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              const Text16Grey("\$\$"),
              Dot(),
              const Text16Grey("Chinese"),
              Dot(),
              const Text16Grey("American"),
              Dot(),
              const Text16Grey("Deshi food"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text12("4.3"),
              SizedBox(width: getW(9.0)),
              Icon(Icons.star, color: AppColors.greenColor, size: getW(16.0)),
              SizedBox(width: getW(9.0)),
              const Text12("200+ Ratings"),
              SizedBox(width: getW(16.0)),
              Icon(Icons.query_builder_sharp, size: getW(17.0)),
              SizedBox(width: getW(7.0)),
              const Text12("25 Min"),
              SizedBox(width: getW(9.0)),
              Dot(),
              Icon(Icons.paid, size: getW(16.0), color: AppColors.greyColor),
              SizedBox(width: getW(9.0)),
              const Text12("Free"),
            ],
          ),
          SizedBox(
            height: getH(10.0),
          ),
        ],
      ),
    );
  }

  SizedBox _indicator(BuildContext context) {
    return SizedBox(
      height: getH(5.0),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (_, __) {
          return Container(
            height: getH(5.0),
            width: getW(8.0),
            decoration: BoxDecoration(
              color: context.watch<PageViewProvider>().currentPage == __
                  ? Colors.white
                  : AppColors.white10Color,
              borderRadius: BorderRadius.circular(
                getH(2.5),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext _, __) {
          
          return SizedBox(
            width: getW(8.0),
          );
        },
        itemCount: context.watch<PageViewProvider>().imagePathes.length,
      ),
    );
  }
}
