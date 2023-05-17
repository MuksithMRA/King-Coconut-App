import 'package:flutter/material.dart';

class AppHeading extends StatelessWidget {
  final String text;
  Color color;
  FontWeight fontWeight;
  double fontSize;

  AppHeading(
      {Key? key,
      required this.text,
      this.color = Colors.black,
      this.fontWeight = FontWeight.w600,
      this.fontSize = 20.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize,overflow: TextOverflow.ellipsis),
    );
  }
}
