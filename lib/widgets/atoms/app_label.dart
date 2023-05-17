import 'package:flutter/material.dart';


class AppLabel extends StatelessWidget {
  final String text;
  Color? textColor;
  FontWeight fontWeight;
  double fontSize;
  FontStyle? fontStyle;

  AppLabel(
      {Key? key,
      required this.text,
      this.textColor = Colors.black,
      this.fontSize = 16.0,
        this.fontStyle,
      this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontStyle: fontStyle,
        overflow: TextOverflow.ellipsis
      ),
    );
  }
}
