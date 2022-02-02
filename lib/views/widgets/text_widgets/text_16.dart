import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';

class Text16 extends StatelessWidget {
  final String text;
  const Text16(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Text(
      text,
      style: TextStyle(
        fontSize: getW(16.0),
      ),
    );
  }
}
