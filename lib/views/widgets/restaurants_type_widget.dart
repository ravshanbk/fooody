import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/providers/page_view_provider.dart';
import 'package:foodly/views/widgets/text_widgets/text_16_grey.dart';
import 'package:foodly/views/widgets/text_widgets/text_20x600.dart';
import 'package:provider/provider.dart';

class RestaurantTypesWidget extends StatelessWidget {
  const RestaurantTypesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: getH(224.0),
      width: getW(214.0),
      padding: EdgeInsets.only(right: getW(14.0),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Ink(
            height: getH(160.0),
            width: getW(200.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  context.watch<PageViewProvider>().imagePathes[2],
                ),
              ),
              borderRadius: BorderRadius.circular(
                getW(10.0),
              ),
            ),
          ),
         const  Text20w600("Daylight Cofee"),
         const Text16Grey("Colarodo San Francisco"),
        ],
      ),
    );
  }
}
