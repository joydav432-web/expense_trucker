import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF2774AE);
  static const Color secondary = Color(0xFF002E5D);
  static const Color dark = Color(0xFF001F40);
  static const Color white = Color(0xffFFFFFF);


  static const LinearGradient appGradient = LinearGradient(
    colors: [
      primary,
      secondary,
      dark,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}