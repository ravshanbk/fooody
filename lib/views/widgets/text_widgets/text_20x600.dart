import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';

class Text20w600 extends StatelessWidget {
  final String text;
  const Text20w600(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: getW(20.0),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
