import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/views/widgets/build_clear_text.dart';
import 'package:foodly/views/widgets/product_tile_widget.dart';

class YourImagedOrders extends StatelessWidget {
  const YourImagedOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getW(20.0)),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                clearAllTextButtonWithTitle("UPCOMING ORDERS"),
                SizedBox(height: getH(21.0)),
                _listOfProducts(),
                SizedBox(height: getH(34.0)),
                clearAllTextButtonWithTitle("PAST ORDERS"),
                SizedBox(height: getH(20.0)),
                _listOfProducts()
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView _listOfProducts() {
    return ListView.separated(
               physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const ProductTile();
                },
                 separatorBuilder: (_, __) {
                  return SizedBox(
                    height: getH(20.0),
                  );
                },
              );
  }

  AppBar _appBar() => AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Your Orders",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      );
}
