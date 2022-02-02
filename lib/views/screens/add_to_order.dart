import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/models/cookie_type_data.dart';
import 'package:foodly/providers/cookieProviders/bottom_cookie_provider.dart';
import 'package:foodly/providers/cookieProviders/top_cookie_provider.dart';
import 'package:foodly/providers/cookie_provider.dart';
import 'package:foodly/views/widgets/cookie_variants_widget.dart';
import 'package:foodly/views/widgets/green_primary_colered_button.dart';
import 'package:foodly/views/widgets/where_from_info_widget.dart';
import 'package:provider/provider.dart';

class AddToOrderPage extends StatelessWidget {
  const AddToOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _sliverAppBar(),
          _description(),
          _topCookies(context),
          _bottomCookies(context),
          _addSpecialInstructions(),
          _quantityBox(context),
          _addToOrderButton(context),
          SliverToBoxAdapter(child: SizedBox(height: getH(25.0))),
        ],
      ),
    );
  }

  SliverToBoxAdapter _addToOrderButton(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getW(20.0)),
        child: ButtonGreenPrimearyColored(
          onPressed: () {
            Navigator.pop(context);
            if (kDebugMode) {
              print("object Get Started Bosildi");
            }
          },
          title: "ADD TO ORDER (\$11.98)",
        ),
      ),
    );
  }

  SliverToBoxAdapter _quantityBox(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: getH(122.0),
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _incrementDecrementButton(context, idf: false),
              SizedBox(width: getW(20.0)),
              Text(
                context.watch<CookieProvider>().quantity > 9
                    ? context.watch<CookieProvider>().quantity.toString()
                    : "0" + context.watch<CookieProvider>().quantity.toString(),
              ),
              SizedBox(width: getW(20.0)),
              _incrementDecrementButton(context, idf: true),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _incrementDecrementButton(BuildContext context,
      {required bool idf}) {
    return ElevatedButton(
      onPressed: () {
        context.read<CookieProvider>().incrementQuantity(idf);
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          getW(54.0),
          getW(54.0),
        ),
        fixedSize: Size(
          getW(54.0),
          getW(54.0),
        ),
        primary: AppColors.inputFillColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getW(27.0),
          ),
        ),
      ),
      child: Icon(
        idf ? Icons.add : Icons.remove,
        color: Colors.black,
      ),
    );
  }

  SliverToBoxAdapter _addSpecialInstructions() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getW(20.0)),
        child: SizedBox(
          height: getH(57.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Special Instructions",
                    style: TextStyle(
                      fontSize: getW(16.0),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    constraints: BoxConstraints.tight(
                      Size(
                        getW(30.0),
                        getH(55.0),
                      ),
                    ),
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getH(2.0),
                child: const Divider(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _topCookies(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: getW(20.0),
          top: getH(10.0),
          right: getW(20.0),
        ),
        child: CookieVariantsWidget(
          title: "Choice of Top Cookie",
          isRequired: true,
          data: CookieTypeData(
            types: context.watch<TopCookieTypeProvider>().cookieTypes,
            func: context.read<TopCookieTypeProvider>().selectedChanger,
            isSelected: context.watch<TopCookieTypeProvider>().isSelecteds,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _bottomCookies(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: getW(20.0),
          top: getH(30.0),
          right: getW(20.0),
        ),
        child: CookieVariantsWidget(
          title: "Choice of Bottom Coo..",
          isRequired: true,
          data: CookieTypeData(
            types: context.watch<BottomCookieTypeProvider>().cookieTypes,
            func: context.read<BottomCookieTypeProvider>().selectedChanger,
            isSelected: context.watch<BottomCookieTypeProvider>().isSelecteds,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _description() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: getH(160.0),
        width: getW(375.0),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getW(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cookie Sandwich",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: getW(24.0),
                ),
              ),
              Text(
                "Shortbread, chocolate turtle cookies, and red\nvelvet. 8 ounces cream cheese, softened.",
                style: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: getW(14.0),
                ),
              ),
              const RowWhereFromInfoWidgeet(),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar _sliverAppBar() {
    return SliverAppBar(
      expandedHeight: getH(280.0),
      toolbarHeight: getH(70.0),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          "assets/images/Header-image.png",
          fit: BoxFit.cover,
          height: getH(280.0),
          width: getW(375.0),
        ),
      ),
      leading: IconButton(
        constraints: BoxConstraints.tight(
          Size(
            getW(34.0),
            getW(34.0),
          ),
        ),
        onPressed: () {},
        icon: Icon(
          Icons.cancel,
          size: getW(34.0),
          color: Colors.black.withOpacity(.4),
        ),
      ),
    );
  }
}
