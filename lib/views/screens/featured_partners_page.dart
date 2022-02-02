import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/views/widgets/page_view_builder_page.dart';

class FeaturedPartners extends StatelessWidget {
  const FeaturedPartners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: _appBar(context),
      body: ListView.builder(itemBuilder: (_, __) {
        return InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/singleRestaurant");
            },
            child: const PageViewBuilderWidget());
      }),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: getW(16.0),
        ),
      ),
      title: Text(
        "Featured Partners",
        style: TextStyle(
          color: Colors.black,
          fontSize: getW(16.0),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
