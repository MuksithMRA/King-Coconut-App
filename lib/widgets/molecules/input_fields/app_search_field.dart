import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class AppSearchField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final  bool isEnable;
  final ValueChanged<String>? onChanged;

  AppSearchField({
    Key? key,
    required this.icon,
    required this.hint,
    this.isEnable = false,
    this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnable,
      textAlign: TextAlign.start,
      style: TextStyle(color: AppColors.appColorGray, fontSize: 14),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: AppColors.appColorGray, fontSize: 14),
        filled: true,
        fillColor: AppColors.appColorGray02,
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: AppColors.appColorGray,
          size: 30,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.all(0),
      ),
      onChanged: onChanged,
    );
  }
}