import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/providers/page_view_provider.dart';
import 'package:provider/provider.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
