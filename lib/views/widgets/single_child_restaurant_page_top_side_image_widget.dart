import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/providers/page_view_provider.dart';
import 'package:provider/provider.dart';

class SingleRestaurantPageTopSideImageWidget extends StatelessWidget {
  const SingleRestaurantPageTopSideImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: PageView.builder(
        onPageChanged: (v) {
          context.read<PageViewProvider>().currentPageChanger(v);
        },
        itemCount: context.watch<PageViewProvider>().imagePathes.length,
        itemBuilder: (_, __) {
          return Ink(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  context.watch<PageViewProvider>().imagePathes[__],
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
