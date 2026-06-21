
import 'package:expense_trucker/activity/activity_screen.dart';
import 'package:expense_trucker/add/screen/add_screen.dart';
import 'package:expense_trucker/home/screen/home_screen.dart';
import 'package:expense_trucker/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/app_Colors.dart';
import '../provider/bottom_navProvider.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({super.key});

  static const String name = '/main-nav';

  @override
  State<MainNavBar> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {

  final List <Widget> _screens =[
    HomeScreen(),
    ActivityScreen(),
    HomeAddScreen(),
    SettingsScreen()




  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavProvider>(
        builder: (context,mainNavProvider,_) {
          return Scaffold(
            body: _screens[mainNavProvider.currentIndex],


            bottomNavigationBar: BottomNavigationBar(
                currentIndex: mainNavProvider.currentIndex,
                unselectedItemColor: Colors.grey,
                selectedItemColor: AppColors.dark,
                showSelectedLabels: true,

                onTap: mainNavProvider.changeIndex,
                items: [

                  BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "dashboard"),
                  BottomNavigationBarItem(icon: Icon(Icons.local_activity_outlined),label: "activity"),
                  BottomNavigationBarItem(icon: Icon(Icons.add_card_outlined),label: "add"),
                  BottomNavigationBarItem(icon: Icon(Icons.settings),label: "settings")
                ]),
          );
        }
    );
  }
}