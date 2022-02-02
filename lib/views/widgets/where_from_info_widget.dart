import 'package:flutter/material.dart';
import 'package:foodly/views/widgets/dot.dart';
import 'package:foodly/views/widgets/text_widgets/text_16_grey.dart';

class RowWhereFromInfoWidgeet extends StatelessWidget {
  const RowWhereFromInfoWidgeet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text16Grey("\$\$"),
        Dot(),
        const Text16Grey("Chinese"),
        Dot(),
        const Text16Grey("American"),
        Dot(),
        const Text16Grey("Deshi food"),
      ],
    );
  }
}
