import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodly/providers/app_bar_delivery_provider.dart';
import 'package:foodly/providers/authProviders/phone_number_provider.dart';
import 'package:foodly/providers/authProviders/sign_in_sign_up_provider.dart';
import 'package:foodly/providers/bottom_navigation_bar_provider.dart/bottom_navigation_bar_provider.dart';
import 'package:foodly/providers/cookieProviders/bottom_cookie_provider.dart';
import 'package:foodly/providers/cookieProviders/top_cookie_provider.dart';
import 'package:foodly/providers/cookie_provider.dart';
import 'package:foodly/providers/filter_provider.dart';
import 'package:foodly/providers/meal_type_provider.dart';
import 'package:foodly/providers/page_view_provider.dart';
import 'package:foodly/providers/settingsProvider.dart';
import 'package:foodly/providers/type_of_foods_provider.dart';
import 'package:foodly/providers/walk_throughs_provider.dart';
import 'package:foodly/routes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: PageViewProvider()),
        ChangeNotifierProvider.value(value: FilterProvider()),
        ChangeNotifierProvider.value(value: AppBarDeliveryToProvider()),
        ChangeNotifierProvider.value(value: MealTypeProvider()),
        ChangeNotifierProvider.value(value: TopCookieTypeProvider()),
        ChangeNotifierProvider.value(value: BottomCookieTypeProvider()),
        ChangeNotifierProvider.value(value: CookieProvider()),
        ChangeNotifierProvider.value(value: TypeOfFoodsProvider()),
        ChangeNotifierProvider.value(value: WalkThroughPageProvider()),
        ChangeNotifierProvider.value(value: LoginByPhoneNumberProvider()),
        ChangeNotifierProvider.value(value: SignInSignUpProvider()),
        ChangeNotifierProvider.value(value: BottomNavigationBarProvider()),
        ChangeNotifierProvider.value(value: SettingsProvider()),
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
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => const Scaffold(
            body: Center(
              child: Text('Not Found'),
            ),
          ),
        );
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
