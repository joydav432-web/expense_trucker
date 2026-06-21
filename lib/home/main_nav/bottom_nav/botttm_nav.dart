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
  final List<Widget> _screens = [
    const HomeScreen(),
    const ActivityScreen(),
    const HomeAddScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavProvider>(builder: (context, mainNavProvider, _) {
      return Scaffold(
        body: IndexedStack(
          index: mainNavProvider.currentIndex,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: mainNavProvider.currentIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: AppColors.dark,
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              if (index == 2) {
                _showAddOptions(context, mainNavProvider);
              } else {
                mainNavProvider.changeIndex(index);
              }
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "dashboard"),
              BottomNavigationBarItem(icon: Icon(Icons.local_activity_outlined), label: "activity"),
              BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 30), label: "add"),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings")
            ]),
      );
    });
  }

  void _showAddOptions(BuildContext context, MainNavProvider provider) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Select Transaction Type",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOption(
                    context,
                    icon: Icons.account_balance_wallet,
                    color: Colors.green,
                    label: "Add Income",
                    onTap: () {
                      Navigator.pop(context);
                      provider.setTransactionType("Income");
                      provider.changeIndex(2);
                    },
                  ),
                  _buildOption(
                    context,
                    icon: Icons.money_off,
                    color: Colors.red,
                    label: "Add Expense",
                    onTap: () {
                      Navigator.pop(context);
                      provider.setTransactionType("Expense");
                      provider.changeIndex(2);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOption(BuildContext context,
      {required IconData icon, required Color color, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, color: color, size: 35),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
