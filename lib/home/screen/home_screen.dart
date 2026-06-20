import 'package:expense_trucker/app/app_Colors.dart';
import 'package:expense_trucker/app/assetsImage_path.dart';
import 'package:flutter/material.dart';

import '../widget/app_appbar.dart';

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
            Container(
              height: 180,
              width: 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(colors: [
                  AppColors.dark,
                  AppColors.primary
                ]),

              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 18.0,top: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("TOTAL BALANCE",
                    style: TextTheme.of(context).labelLarge,),
                    
                    
                    Text('৳50,000',
                      style: TextTheme.of(context).headlineLarge,
                    ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Text("INCOME",style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue
                        )),
                        SizedBox(height: 6),
                        Text("5000",
                        style: TextTheme.of(context).headlineSmall,
                        )
                      ],
                    ),

                    SizedBox(width: 100),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("EXPENSES",style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.redAccent,
                    )
                        ),
                        SizedBox(height: 6),
                        Text("4000",style: TextTheme.of(context).headlineSmall
                          )
                      ],
                    ),
                  ],
                )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),





          ],
        ),
      ),


    );
  }
}

