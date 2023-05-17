import 'dart:convert';
import 'package:get/get.dart';
import 'package:kingcoconut/constants/app_colors.dart';
import 'package:kingcoconut/constants/routes.dart';
import 'package:kingcoconut/models/disease.dart';
import 'package:kingcoconut/models/growing_detection.dart';
import 'package:kingcoconut/models/user.dart';
import 'package:kingcoconut/services/apiService.dart';
import 'package:kingcoconut/services/sharedPref.dart';
import 'package:kingcoconut/widgets/custom_dialog_box.dart';
import 'package:kingcoconut/widgets/custom_snack_bar.dart';

class ApiController extends GetxController {
  var isProfileLoading = false.obs;
  var user = User();
  var disease = Diseasedetect();
  var growing = Growingdetect();

  void userlogin(String username, String password) async {
    print(username);
    print(password);
    try {
      CustomDialogBox.buildDialogBox();
      var response =
          await ApiService().userlogin(username: username, password: password);
      Get.back();
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = jsonDecode(response.body);
        SharedPref().addUserBox("user_id", decodedData['user_id']);
        Get.toNamed(Routes.DASHBOARD);
      }
    } catch (e) {
      Get.back();
      CustomSnackBar.buildSnackBar(title: "", message: "Something went wrong!");
    }
  }

  void userSignup(
      String username, String email, String number, String password) async {
    try {
      CustomDialogBox.buildDialogBox();
      var response = await ApiService().userSignup(
          username: username, password: password, email: email, number: number);
      Get.back();

      print("222222");
      print(response);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        Get.toNamed(Routes.LOGIN);
      } else if (response.statusCode == 400) {
        CustomSnackBar.buildSnackBar(
            title: "", message: "invalid username or password");
      }
    } catch (e) {
      Get.back();
      CustomSnackBar.buildSnackBar(title: "", message: "Something went wrong!");
    }
  }

  void getProfile() async {
    print("customer device");

    try {
      isProfileLoading.value = true;
      var response =
          await ApiService().getProfile(token: SharedPref.getToken()!);
      isProfileLoading.value = false;
      print("aaaaaaaa");
      if (response.statusCode == 200) {
        print("adddddddaaaaaaa");
        Map<String, dynamic> decodedData = jsonDecode(response.body);
        print(response.statusCode);
        print(decodedData);
        user = User.fromJson(decodedData);
      } else {
        CustomSnackBar.buildSnackBar(
            title: "",
            message: "Invalid Response",
            bgColor: AppColors.appColorBlack);
      }
    } catch (e) {
      print(e);
      CustomSnackBar.buildSnackBar(title: "", message: "Something went wrong");
    }
  }

  void deleteProfile() async {
    print("customer device");

    try {
      var response =
          await ApiService().deleteProfile(token: SharedPref.getToken()!);

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = jsonDecode(response.body);

        if (response.statusCode == 200) {
          print(response.statusCode);
          print(decodedData);
          CustomSnackBar.buildSnackBar(
              title: "",
              message: decodedData['message'],
              bgColor: AppColors.appColorBlack);
          Get.toNamed(Routes.LOGIN);
        } else {
          CustomSnackBar.buildSnackBar(
              title: "",
              message: decodedData['errorMessage'],
              bgColor: AppColors.appColorBlack);
        }
      } else {
        CustomSnackBar.buildSnackBar(
            title: "",
            message: "Invalid Response",
            bgColor: AppColors.appColorBlack);
      }
    } catch (e) {
      print(e);
      CustomSnackBar.buildSnackBar(title: "", message: "Something went wrong");
    }
  }

  void growingDetection({required image, required age}) async {
    try {
      CustomDialogBox.buildDialogBox();
      print("aaaaaaaaaa");
      print(age);
      print(image);
      var response = await ApiService().growingDetection(
        baseImg: image,
        age: age,
      );
      // Get.back();
      print(response);
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = jsonDecode(response.body);
        print(response.statusCode);
        print(decodedData);
        growing = Growingdetect.fromJson(decodedData);
        Get.toNamed(Routes.GROWING_LANGUAGE);
      }
    } catch (e) {
      Get.back();
      CustomSnackBar.buildSnackBar(title: "", message: "Something went wrong!");
    }
  }

  void diseaseDetection({required String image}) async {
    try {
      CustomDialogBox.buildDialogBox();
      // print("aaaaaaaaaa");
      // print(image);
      // print(age);
      var response = await ApiService().diseaseDetection(
        baseImg: image,
      );
      print("wwwwwwwww");
      // Get.back();
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = jsonDecode(response.body);
        print(response.statusCode);
        print(decodedData);
        disease = Diseasedetect.fromJson(decodedData);
        // Get.toNamed(Routes.DDETAILSSCREEN);
        Get.toNamed(Routes.DISEASE_LANGUAGE);
        print(disease.disease?.treatmentInEnglish);
        print("aaaaaaaa");
      }
    } catch (e) {
      Get.back();
      CustomSnackBar.buildSnackBar(title: "", message: "Something went wrong!");
    }
  }
}
