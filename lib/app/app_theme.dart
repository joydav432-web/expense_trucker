

import 'package:expense_trucker/app/app_Colors.dart';
import 'package:flutter/material.dart';

class AppTheme{

  static ThemeData get lightTheme =>_lightThemeData;
  static ThemeData get darkTheme=>_darkThemeData;

  static final ThemeData _lightThemeData = ThemeData(


      progressIndicatorTheme: ProgressIndicatorThemeData(

          color: AppColors.white
      ),

      scaffoldBackgroundColor: AppColors.white,

      textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontWeight: FontWeight.w600,

          ),

          labelLarge: TextStyle(
              fontWeight: FontWeight.w400,
          )

      ),

      appBarTheme: AppBarTheme(

        backgroundColor: Colors.white,
      ),

      inputDecorationTheme: _inputDecorationTheme,

      filledButtonTheme: _filledButtonThemeData

  );


  static final ThemeData _darkThemeData = ThemeData(
      brightness: Brightness.dark,
      progressIndicatorTheme: ProgressIndicatorThemeData(
      ),

      inputDecorationTheme: _inputDecorationTheme,
      filledButtonTheme: _filledButtonThemeData
  );

  static final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(

      contentPadding: EdgeInsets.only(left: 12),

      border: OutlineInputBorder(
          borderSide: BorderSide(
              width: 3

          )
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 3
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 3
          )
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 3

          )
      )
  );


  static final FilledButtonThemeData _filledButtonThemeData = FilledButtonThemeData(

      style:FilledButton.styleFrom(
          fixedSize: Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          )
      )
  );


}