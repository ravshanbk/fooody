import 'package:flutter/material.dart';
import 'package:foodly/providers/app_bar_delivery_provider.dart';
import 'package:foodly/providers/filter_provider.dart';
import 'package:foodly/providers/page_view_provider.dart';
import 'package:foodly/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PageViewProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FilterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppBarDeliveryToProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foody',
      initialRoute: '/',
      onGenerateRoute: (setting) => RouteManager.generaRouter(setting),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
