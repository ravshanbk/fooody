import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/providers/page_view_provider.dart';
import 'package:foodly/views/widgets/text_widgets/text_16.dart';
import 'package:provider/provider.dart';

class TypeOfFoodsItemWidget extends StatelessWidget {
  final String name;
  const TypeOfFoodsItemWidget(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: getH(140.0),
      width: getW(114.0),
      padding: EdgeInsets.only(
        right: getW(14.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Ink(
            height: getH(100.0),
            width: getW(100.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  context.watch<PageViewProvider>().imagePathes[3],
                ),
              ),
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(
                getW(8.0),
              ),
            ),
          ),
          Text16(name),
        ],
      ),
    );
  }
}
