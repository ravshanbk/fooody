import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';

AppBar appBarOfSignInSignUpPage(String title) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    ),
    title: Text(
      title,
      style: TextStyle(
        fontSize: getW(16.0),
        color: Colors.black,
      ),
    ),
  );
}
