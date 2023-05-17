import 'package:get/get.dart';
import 'package:kingcoconut/main.dart';
import 'package:kingcoconut/screens/ChangeLanguage.dart';
import 'package:kingcoconut/screens/Chat/chat_details_screen.dart';
import 'package:kingcoconut/screens/Disease_detection/disease_detai_sinhala_screen.dart';
import 'package:kingcoconut/screens/Disease_detection/disease_detail_screen.dart';
import 'package:kingcoconut/screens/Disease_detection/disease_detection.dart';
import 'package:kingcoconut/screens/Disease_detection/disease_language.dart';
import 'package:kingcoconut/screens/Growing_detection/detection_screen.dart';
import 'package:kingcoconut/screens/Growing_detection/disease_detail_screen.dart';
import 'package:kingcoconut/screens/Growing_detection/disease_detail_sinhala_screen.dart';
import 'package:kingcoconut/screens/Growing_detection/growing_language.dart';
import 'package:kingcoconut/screens/account_screen.dart';
import 'package:kingcoconut/screens/auth/login_screen.dart';
import 'package:kingcoconut/screens/auth/signupScreen.dart';
import 'package:kingcoconut/screens/charts/chart_filter.dart';
import 'package:kingcoconut/screens/dashboard.dart';

class Routes {
  static const MY_APP = "/";
  static const LOCALIZATION_SCREEN = "/LocationServiceScreen";
  static const LOGIN = "/Login";
  static const SIGNUP = "/Signup";
  // static const FORGET_PASSWORD_SCREEN = "/ForgotPasswordScreen";
  //
  static const DASHBOARD = "/Dashboard";

  static const GROWING_DETECT = "/GrowingDetect";
  static const DISEASE_DETECT = "/DiseaseDetect";
  static const PROFILE_SCREEN = "/ProfileScreen";

  //
  //
  static const CHATDETAILSCREEN = "/ChatDetailScreen";
  static const CHART_PAGE = "/Chart_Page";
  static const CHART_FILTER = "/Chart_Filter";
  static const DDETAILSSCREEN = "/DDetailsScreen";
  static const DDETAILSSinhalaSCREEN = "/DDetailsSinhalaScreen";
  static const GDETAILSSCREEN = "/GDetailsScreen";
  static const DISEASE_LANGUAGE = "/ChangediseaseLanguagePage";

  static const GROWING_LANGUAGE = "/ChangegrowingLanguagePage";
  static const GDetails_SinhalaScreen = "/GDetails_SinhalaScreen";

  static List<GetPage> getPageRoutes() {
    return [
      GetPage(name: MY_APP, page: () => const MyApp()),
      GetPage(
          name: LOCALIZATION_SCREEN, page: () => const ChangeLanguagePage()),
      GetPage(name: LOGIN, page: () => LoginScreen()),
      GetPage(name: SIGNUP, page: () => SignupScreen()),
      GetPage(name: GROWING_DETECT, page: () => const GDetectionScreen()),
      GetPage(
        name: DASHBOARD,
        page: () => const DashboardScreen(),
      ),
      GetPage(
        name: PROFILE_SCREEN,
        page: () => const ProfileScreen(),
      ),
      GetPage(
        name: DISEASE_DETECT,
        page: () => const DDetectionScreen(),
      ),
      GetPage(
        name: CHATDETAILSCREEN,
        page: () => ChatDetailScreen(),
      ),
      // GetPage(
      //   name: CHART_PAGE,
      //   page: () => const ChartPage(),
      // ),
      GetPage(
        name: CHART_FILTER,
        page: () => const ChartFilter(),
      ),
      GetPage(
        name: DDETAILSSCREEN,
        page: () => DDetailsScreen(),
      ),
      GetPage(
        name: DDETAILSSinhalaSCREEN,
        page: () => const DDetailsSinhalaScreen(),
      ),
      GetPage(
        name: GDETAILSSCREEN,
        page: () => GDetailsScreen(),
      ),
      GetPage(
        name: DISEASE_LANGUAGE,
        page: () => const ChangediseaseLanguagePage(),
      ),
      GetPage(
        name: GROWING_LANGUAGE,
        page: () => ChangegrowingLanguagePage(),
      ),
      GetPage(
        name: GDetails_SinhalaScreen,
        page: () => GDetailsSinhalaScreen(),
      ),
    ];
  }
}
