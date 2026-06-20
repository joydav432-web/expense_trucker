
import 'package:expense_trucker/home/screen/home_screen.dart';
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
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),




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
                  BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "category"),
                  BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined),label: "cart"),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),label: "wishlist")
                ]),
          );
        }
    );
  }
}