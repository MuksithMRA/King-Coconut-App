import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kingcoconut/constants/routes.dart';
import 'package:kingcoconut/controllers/network_controller.dart';
import 'package:kingcoconut/localization/demo_localization.dart';
import 'package:kingcoconut/localization/language_constants.dart';
import 'package:kingcoconut/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

void main() async {
  await GetStorage.init('userBox');
  Get.lazyPut<NetworkController>(() => NetworkController(), fenix: true);
  runApp(const MyApp());
  RenderErrorBox.backgroundColor = Colors.transparent;
  RenderErrorBox.textStyle = ui.TextStyle(color: Colors.transparent);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newlocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newlocale);
    print(newlocale);
  }

  static void setLocaleSettings(BuildContext context, Locale newlocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newlocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences prefs;
  late Locale _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    _locale = const Locale('si');
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      getPages: Routes.getPageRoutes(),
      home: const HomeScreen(),
      locale: _locale,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('si', 'SN'),
      ],
      localizationsDelegates: const [
        DemoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
