
import 'package:expense_trucker/activity/activity_screen.dart';
import 'package:expense_trucker/app/app_Colors.dart';
import 'package:expense_trucker/home/main_nav/provider/bottom_navProvider.dart';
import 'package:expense_trucker/home/screen/show_transcription.dart';
import 'package:expense_trucker/provider_for_save_data/save_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/app_appbar.dart';
import 'home+header.dart';

class HomeScreen extends  StatefulWidget{
  const HomeScreen({super.key});

  static const String name = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ExpenseProvider provider = ExpenseProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppAppbar(),

      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            HomeHeader(),

            const SizedBox(height: 20),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
                
                Text("Recent Transactions",
                style: TextTheme.of(context).headlineMedium,
                ),

                Consumer<ExpenseProvider>(
                  builder: (context, provider, child) {

                    return TextButton(

                      onPressed: () {
                        context.read<MainNavProvider>().changeIndex(1);
                      },

                      child: Text(
                        "SEE ALL (${provider.expenses.length})",
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                        ),
                      ),

                    );

                  },
                ),


              ],
            ),
            const SizedBox(height: 10),

            ShowTranscription()


          ],
        ),
      ),


    );
  }
}

