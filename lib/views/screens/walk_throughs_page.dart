import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/providers/authProviders/sign_in_sign_up_provider.dart';
import 'package:foodly/providers/walk_throughs_provider.dart';
import 'package:foodly/views/widgets/green_primary_colered_button.dart';
import 'package:foodly/views/widgets/walk_throughs_child_widget.dart';
import 'package:provider/provider.dart';

class WalkThroughs extends StatelessWidget {
  const WalkThroughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 60,
            ),
            _buildPageView(context),
            _indicator(context),
            SizedBox(height: getH(60.0)),
            _getStartedButton(context),
            SizedBox(height: getH(80.0)),
          ],
        ),
      ),
    );
  }

  _buildPageView(BuildContext _) {
    return SizedBox(
      height: getH(590.0),
      child: PageView(
        onPageChanged: (v) {
          _.read<WalkThroughPageProvider>().indicatorColorChanger(v);
        },
        controller: _.read<WalkThroughPageProvider>().controller,
        children: [
          WalkThroughPageViewChild(0),
          WalkThroughPageViewChild(1),
          WalkThroughPageViewChild(2),
        ],
      ),
    );
  }

  _getStartedButton(BuildContext context) {
    return ButtonGreenPrimearyColored(
      onPressed: () {
        context.read<SignInSignUpProvider>().tokenIsExpired().then(
          (value) {
            if (value) {
              Navigator.pushNamed(context, "/signUp");
            } else {
              Navigator.pushNamed(context, "/bodyPage");
            }
          },
        );
      },
      title: "GET STARTED",
    );
  }

  SizedBox _indicator(BuildContext context) {
    return SizedBox(
      height: getW(5.0),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (_, __) {
          return Ink(
            height: getW(5.0),
            width: getW(8.0),
            decoration: BoxDecoration(
              color: _.watch<WalkThroughPageProvider>().indicatorColors[__],
              borderRadius: BorderRadius.circular(
                getW(2.5),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: getW(8.0),
          );
        },
      ),
    );
  }
}
