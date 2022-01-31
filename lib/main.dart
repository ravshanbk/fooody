import 'package:flutter/material.dart';
import 'package:foodly/core/components/size_config.dart';
import 'package:foodly/providers/app_bar_delivery_provider.dart';
import 'package:foodly/providers/filter_provider.dart';
import 'package:foodly/providers/page_view_provider.dart';
import 'package:foodly/views/screens/home_pages/home_v1_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiProvider(
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Foody',
        // home:  const HomePageV1(),
        home: Scaffold(body: Container()),
        // initialRoute: '/',
        // onGenerateRoute: (setting) => RouteManager.generaRouter(setting),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );  
  }
}
