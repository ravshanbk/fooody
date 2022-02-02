import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/views/widgets/stacked_icon.dart';
import 'package:foodly/views/widgets/text_widgets/text_12.dart';
import 'package:foodly/views/widgets/where_from_info_widget.dart';

class SingleChildRestaurantDescription extends StatelessWidget {
  const SingleChildRestaurantDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      color:const  Color(0xffFFFFFF),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getW(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getH(14.0),
            ),
            Text(
              "McDonald's",
              style: TextStyle(
                fontSize: getW(20.0),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: getH(14.0)),
     const     RowWhereFromInfoWidgeet(),
            SizedBox(height: getH(16.0)),
            _ratings(),
            SizedBox(height: getH(24.0)),
            _deliveryTimeFee(),
          ],
        ),
      ),
    );
  }

  Row _deliveryTimeFee() {
    return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StackedIcon(icon: Icons.paid),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Free",
                      style: TextStyle(
                          fontSize: getW(16.0), fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: getH(5.0)),
                    Text(
                      "Delivery",
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: getW(12.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: getW(20.0)),
                const StackedIcon(icon: Icons.watch_later),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Free",
                      style: TextStyle(
                          fontSize: getW(16.0), fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: getH(5.0)),
                    Text(
                      "minutes",
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: getW(12.0),
                      ),
                    ),
                  ],
                ),
   const    Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      getW(113.0),
                      getH(38.0),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        getW(10.0),
                      ),
                    ),
                    primary: Colors.transparent,
                    elevation: 0,
                    side: BorderSide(
                      color: AppColors.greenColor,
                      width: getW(1.0),
                    ),
                  ),
                  child: Text(
                    "TAKE AWAY",
                    style: TextStyle(
                      fontSize: getW(12.0),
                      color: AppColors.greenColor,
                    ),
                  ),
                ),
              ],
            );
  }

  Row _ratings() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text12("4.3"),
                SizedBox(width: getW(9.0)),
                Icon(Icons.star,
                    color: AppColors.greenColor, size: getW(16.0)),
                SizedBox(width: getW(9.0)),
                const Text12("200+ Ratings"),
                SizedBox(width: getW(16.0)),
                           ],
            );
  }

}
