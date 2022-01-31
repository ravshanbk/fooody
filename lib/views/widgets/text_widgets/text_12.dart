import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';

class Text12 extends StatelessWidget {
  final String title;
  const Text12(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: getW(12.0),color: Colors.black,),
    );
  }
}
