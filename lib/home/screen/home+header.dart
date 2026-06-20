
import 'package:flutter/material.dart';

import '../../app/app_Colors.dart';
class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

