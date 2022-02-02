import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/providers/walk_throughs_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class WalkThroughPageViewChild extends StatelessWidget {
  final int idf;
   WalkThroughPageViewChild(this.idf, {Key? key}) : super(key: key);
    List<String> pictures = ["assets/images/walkThrough0.png","assets/images/walkThrough1.png","assets/images/walkThrough2.png",];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _imageBox(),
        SizedBox(height: getH(40.0)),
        _textAllYourFavorites(context),
        SizedBox(
          height: getH(32.0),
        ),
        
      ],
    );
  }

   _imageBox() {
    return Expanded(
      child: Image.asset(
      pictures[idf],
        
      ),
    );
  }

  _textAllYourFavorites(BuildContext _) {
    return SizedBox(
      height: getH(86.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _.watch<WalkThroughPageProvider>().titles[idf],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: getW(30.0),
            ),
          ),
          Text(
            _.watch<WalkThroughPageProvider>().subTitles[idf][0],
            style: TextStyle(
              fontSize: getW(16.0),
            ),
          ),
          Text(
            _.watch<WalkThroughPageProvider>().subTitles[idf][1],
            style: TextStyle(
              fontSize: getW(16.0),
            ),
          ),
        ],
      ),
    );
  }

 
}
