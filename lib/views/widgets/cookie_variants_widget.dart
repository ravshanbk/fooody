import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/models/cookie_type_data.dart';
import 'package:foodly/providers/cookieProviders/top_cookie_provider.dart';
import 'package:foodly/views/widgets/text_widgets/text_20x600.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CookieVariantsWidget extends StatelessWidget {
  final String title;
  final CookieTypeData data;
  bool? isRequired;
  CookieVariantsWidget(
      {required this.title, required this.data, this.isRequired, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _title(),
        _body(context),
      ],
    );
  }

  ListView _body(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: getH(5.0)),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: context.watch<TopCookieTypeProvider>().cookieTypes.length,
      itemBuilder: (_, __) {
        return _itemBuilder(__);
      },
    );
  }

  Row _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text20w600(title),
        Container(
          height: getH(32.0),
          width: getW(90.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.orangeAccentColor,
            borderRadius: BorderRadius.circular(
              getW(5.0),
            ),
          ),
          child: Text(
            isRequired ?? false ? "REQUIRED" : "OPTIONAL",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.orengeColor,
              fontSize: getW(12.0),
            ),
          ),
        ),
      ],
    );
  }

  _itemBuilder(int __) {
    return Column(
      children: [
        SizedBox(
          height: getH(50.0),
          child: InkWell(
            onTap: () {
              data.func(__);
            },
            child: Row(
              children: [
                data.isSelected[__]
                    ? Icon(
                        Icons.radio_button_checked,
                        size: getW(30.0),
                        color: AppColors.greenColor,
                      )
                    : Icon(
                        Icons.circle_outlined,
                        color: AppColors.greyColor,
                        size: getW(30.0),
                      ),
                SizedBox(
                  width: getW(14.0),
                ),
                Text(
                  data.types[__],
                  style: TextStyle(
                    fontSize: getW(16.0),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: getH(2.0),
          child: const Divider(),
        )
      ],
    );
  }
}
