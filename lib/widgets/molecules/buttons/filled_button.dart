import 'package:flutter/material.dart';
import 'package:kingcoconut/constants/app_colors.dart';

class FilledCustomButton extends StatelessWidget {
  final String text;
  final Function clickEvent;
  Color bgColor;
  Color textColor;
  double height;
  double? width;
  double radius;
  double fontSize;

  FilledCustomButton(
      {Key? key,
      required this.text,
      required this.clickEvent,
      this.bgColor = AppColors.appColorFacebookBlue,
      this.textColor = AppColors.appColorWhite,
      this.height = 50.0,
      this.width,
      this.radius = 6.0,
      this.fontSize = 14.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    width ??= MediaQuery.of(context).size.width;
    return SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(textColor),
                backgroundColor: MaterialStateProperty.all<Color>(bgColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radius),
                        side: BorderSide(color: bgColor)))),
            onPressed: () {
              clickEvent();
            },
            child: Text(text,
                style: TextStyle(
                    fontSize: fontSize, fontWeight: FontWeight.w500))));
  }
}
