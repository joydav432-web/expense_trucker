import 'package:expense_trucker/app/splash_screen.dart';
import 'package:expense_trucker/home/screen/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes{

  static Route <dynamic>? onGenarateRoute(RouteSettings settings) {

    Widget widget = SizedBox();

    switch(settings.name) {
      case SplashScreen.name:
        widget = SplashScreen();
        break;

      case HomeScreen.name:
        widget = HomeScreen();
        break;


    }
    return MaterialPageRoute(builder: (context)=>widget);
  }

}