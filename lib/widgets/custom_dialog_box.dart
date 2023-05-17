import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:kingcoconut/constants/app_colors.dart';
import 'package:kingcoconut/widgets/atoms/app_label.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomDialogBox {
  static buildDialogBox({String? text}) {
    Get.defaultDialog(
        title: "",
        titlePadding: EdgeInsets.zero,
        contentPadding: const EdgeInsets.all(30),
        barrierDismissible: false,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SpinKitCircle(
              color: AppColors.appColorBlack,
            ),
            const SizedBox(
              height: 10,
            ),
            AppLabel(
              text: text ?? "Please wait!",
              fontSize: 12,
            )
          ],
        ));
  }

  static buildConfirmOrCancelDialog(
      {String title = "",
      required String description,
      String confirmText = "Ok",
      String cancelText = "Cancel",
      Widget? content,
      required Function confirmEvent}) {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.only(left: 5),
      title: title,
      middleText: description,
      backgroundColor: Colors.white,
      titleStyle: TextStyle(color: AppColors.appColorBlack),
      // titlePadding: EdgeInsetsGeometry.lerp(EdgeInsets.zero,EdgeInsets.only(left: 3, ) , 5),
      middleTextStyle: const TextStyle(color: AppColors.appColorBlack),
      buttonColor: AppColors.appColorBlack,
      barrierDismissible: false,
      radius: 15,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  confirmEvent();
                },
                child: Text(
                  confirmText,
                  style: const TextStyle(
                      color: AppColors.appColorFacebookBlue,
                      fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              width: 10,
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(cancelText,
                  style: const TextStyle(
                      color: AppColors.appColorFacebookBlue,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ],
      content: content,
    );
  }
}
