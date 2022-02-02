import 'package:flutter/material.dart';
import 'package:foodly/core/components/app_app_bar.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/providers/type_of_foods_provider.dart';
import 'package:foodly/views/widgets/page_view_builder_page.dart';
import 'package:foodly/views/widgets/restaurants_type_widget.dart';
import 'package:foodly/views/widgets/see_all_button_in_row_with_title.dart';
import 'package:foodly/views/widgets/type_of_foods_item_widget.dart';
import 'package:provider/provider.dart';

class HomePageV3 extends StatelessWidget {
  const HomePageV3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: appBarDeliveryTo(context,
         ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _verticalListViewBuilderOfPageViews(3),
            const SeeAllButtonInRowWithTitle("Type of Foods"),
            SizedBox(
              height: getH(10.0),
            ),
            _foodTypesOfHorizontalListView(context),
            const SeeAllButtonInRowWithTitle("New Restaurants"),
            SizedBox(
              height: getH(224.0),
              child: ListView.builder(
                padding: EdgeInsets.only(
                  left: getW(20.0),
                ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, __) {
                  return const RestaurantTypesWidget();
                },
              ),
            ),
            _verticalListViewBuilderOfPageViews(5)
          ],
        ),
      ),
    );
  }

  SizedBox _foodTypesOfHorizontalListView(BuildContext context) {
    return SizedBox(
      height: getH(140.0),
      child: ListView.builder(
        padding: EdgeInsets.only(left: getW(20.0)),
        scrollDirection: Axis.horizontal,
        itemCount: context.watch<TypeOfFoodsProvider>().types.length,
        itemBuilder: (_, __) {
          return TypeOfFoodsItemWidget(
            context.watch<TypeOfFoodsProvider>().types[__],
          );
        },
      ),
    );
  }

  ListView _verticalListViewBuilderOfPageViews(int length) {
    return ListView.builder(
      padding: EdgeInsets.only(
        top: getH(24.0),
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: length,
      itemBuilder: (_, __) {
        return const PageViewBuilderWidget();
      },
    );
  }
}
