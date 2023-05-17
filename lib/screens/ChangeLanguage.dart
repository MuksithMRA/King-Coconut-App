import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kingcoconut/classes/language.dart';
import 'package:kingcoconut/constants/app_colors.dart';
import 'package:kingcoconut/constants/routes.dart';
import 'package:kingcoconut/localization/language_constants.dart';
import 'package:kingcoconut/main.dart';
import 'package:kingcoconut/widgets/molecules/buttons/filled_button.dart';

class ChangeLanguagePage extends StatefulWidget {
  const ChangeLanguagePage({super.key});

  // ChangeLanguagePage({required Key key}) : super(key: key);
  @override
  _ChangeCountryPageState createState() => _ChangeCountryPageState();
}

class _ChangeCountryPageState extends State<ChangeLanguagePage> {
  void _changeLanguage(Language language) async {
    print(language.languageCode);
    Locale locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(40),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        getTranslated(context, 'change_language')!,
                        style: const TextStyle(
                          color: Colors.black26,
                          fontSize: 22,
                        ),
                      ),
                      const CloseButton()
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.appColorWhite),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.appColorprimary),
                              shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          side: const BorderSide(
                                              color: AppColors
                                                  .appColorFacebookBlue)))),
                          onPressed: () {
                            _changeLanguage(Language.languageList().first);
                            Get.toNamed(Routes.SIGNUP);
                          },
                          child: Text(
                              "${Language.languageList().first.flag} ${Language.languageList().first.name}",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)))),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.appColorWhite),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.appColorprimary),
                              shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          side: const BorderSide(
                                              color: AppColors
                                                  .appColorFacebookBlue)))),
                          onPressed: () {
                            _changeLanguage(Language.languageList().last);
                            Get.toNamed(Routes.SIGNUP);
                          },
                          child: Text(
                              "${Language.languageList().last.flag}   ${Language.languageList().last.name}",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500))))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
