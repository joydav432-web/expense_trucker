import 'package:expense_trucker/activity/activity_screen.dart';
import 'package:expense_trucker/app/splash_screen.dart';
import 'package:expense_trucker/home/main_nav/bottom_nav/botttm_nav.dart';
import 'package:expense_trucker/home/screen/home_screen.dart';
import 'package:expense_trucker/home/widget/add_deatils_screen.dart';
import 'package:expense_trucker/settings/settings_screen.dart';
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

      case MainNavBar.name:
        widget = MainNavBar();
        break;

      case ExpenseDetailsScreen.name:

        widget = const ExpenseDetailsScreen();

        break;

      case ActivityScreen.name:
        widget = const ActivityScreen();
        break;

      case SettingsScreen.name:
        widget = const SettingsScreen();
        break;



    }
    return MaterialPageRoute(builder: (context)=>widget,
    settings: settings
    );
  }

}