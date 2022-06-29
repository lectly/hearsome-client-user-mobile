import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color transparent = Color(0x00000000);
  static LinearGradient background = const LinearGradient(
    colors: [
      Color(0xFF5632D0),
      Color(0xFF9A84E3),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const Color primaryColor = Color(0xFFFFFFFF);
  static const Color primaryColorDark = Color(0xFF25242B);
  static const Color secondaryColor = Color(0xDCDCDCDC);

}






