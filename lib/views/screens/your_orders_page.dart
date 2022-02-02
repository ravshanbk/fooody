import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/views/widgets/green_primary_colered_button.dart';

class YourOrdersPage extends StatelessWidget {
  const YourOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getW(20.0)),
          child: Column(
            children: [
              _ordersList(),
              SizedBox(height: getH(16.0)),
              _bill(),
              SizedBox(height: getH(7.0)),
              _listTilebutton("Add more items"),
              _listTilebutton("Promo code"),
              SizedBox(height: getH(47.0)),
              ButtonGreenPrimearyColored(
                onPressed: (int inr) {
                  if (kDebugMode) {
                    print("object Get Started Bosildi $inr");
                  }
                },
                title: "CONTINUE (\$11.98)",
              ),
              SizedBox(height: getH(30.0)),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _listTilebutton(String title) {
    return SizedBox(
      height: getH(55.0),
      child: ListTile(
        dense: true,
        onTap: () {
          if (title == "Add more items") {
          } else {}
        },
        contentPadding: const EdgeInsets.all(0.0),
        title: Text(
          title,
          style: TextStyle(
            color:
                title == "Add more items" ? AppColors.greenColor : Colors.black,
            fontSize: getW(16.0),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: getW(18.0),
        ),
        shape: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.inputFillColor,
            width: getW(1.0),
          ),
        ),
      ),
    );
  }

  SizedBox _bill() {
    return SizedBox(
      height: getH(100.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal",
                style: TextStyle(
                  fontSize: getW(16.0),
                ),
              ),
              Text(
                "\$29.0",
                style: TextStyle(
                  fontSize: getW(16.0),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal",
                style: TextStyle(
                  fontSize: getW(16.0),
                ),
              ),
              Text(
                "\$29.0",
                style: TextStyle(
                  fontSize: getW(16.0),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal",
                style: TextStyle(
                  fontSize: getW(16.0),
                ),
              ),
              Text(
                "\$29.0",
                style: TextStyle(
                  fontSize: getW(16.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ListView _ordersList() {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (_, __) {
          return Ink(
            padding: EdgeInsets.only(top: getH(20.0)),
            height: getH(118.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.inputFillColor,
                  width: getW(1.0),
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: getH(24.0),
                  width: getH(24.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.greyColor,
                      width: getW(1.0),
                    ),
                    borderRadius: BorderRadius.circular(
                      getW(6.0),
                    ),
                  ),
                  child: Text(
                    "1",
                    style: TextStyle(
                      color: AppColors.greenColor,
                      fontSize: getW(16.0),
                    ),
                  ),
                ),
                SizedBox(width: getW(16.0)),
                SizedBox(
                  width: getW(295.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Combo Burger",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: getW(18.0),
                            ),
                          ),
                          Text(
                            "USD12.0",
                            style: TextStyle(
                              color: AppColors.greenColor,
                              fontSize: getW(14.0),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getH(6.0)),
                      Text(
                        'Shortbread, chocolate turtle\ncookies, and red velvet.',
                        style: TextStyle(
                          fontSize: getW(16.0),
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
      title: Text(
        "Your Orders",
        style: TextStyle(
          fontSize: getW(16.0),
          color: Colors.black,
        ),
      ),
    );
  }
}
