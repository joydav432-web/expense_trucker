
import 'package:expense_trucker/app/app_Colors.dart';
import 'package:expense_trucker/home/screen/show_transcription.dart';
import 'package:flutter/material.dart';

import '../widget/app_appbar.dart';
import 'home+header.dart';

class HomeScreen extends  StatefulWidget{
  const HomeScreen({super.key});

  static const String name = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

                TextButton(onPressed: (){},
                    child: Text("SEE ALL",style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary
                    ),))
                
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

