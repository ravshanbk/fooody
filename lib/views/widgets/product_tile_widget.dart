import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/views/widgets/dot.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: getH(110.0),
        child: Row(
          children: [
            Ink(
              height: getH(110.0),
              width: getH(110.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getW(10.0)),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/dish5.jpeg"),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: getH(110.0),
              width: getW(218.6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Combo Burger",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: getW(18.0),
                    ),
                  ),
                  SizedBox(
                    height: getH(8.0),
                  ),
                  Text(
                    "Shortbread, chocolate turtle",
                    style: TextStyle(
                      fontSize: getW(14.0),
                    ),
                  ),
                  SizedBox(height: getH(4.0)),
                  Text(
                    "cookies, and red velvet.",
                    style: TextStyle(
                      fontSize: getW(14.0),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$\$",
                        style: TextStyle(
                          fontSize: getW(14.0),
                        ),
                      ),
                      SizedBox(width: getW(8.0)),
                      Dot(),
                      SizedBox(width: getW(8.0)),
                      Text(
                        "Chinese",
                        style: TextStyle(
                          fontSize: getW(14.0),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "USD7.4",
                        style: TextStyle(
                            color: AppColors.greenColor,
                            fontSize: getW(14.0),
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}