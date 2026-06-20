import 'package:expense_trucker/add/widget/ammount_box.dart';
import 'package:expense_trucker/add/widget/category_section.dart';
import 'package:flutter/material.dart';

import '../widget/add_appbar.dart';
import '../widget/title_filed.dart';

class HomeAddScreen extends StatefulWidget {
  const HomeAddScreen({super.key});

  static const String name = '/add';

  @override
  State<HomeAddScreen> createState() => _HomeAddScreenState();
}

class _HomeAddScreenState extends State<HomeAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AddScreenAppbar(),


      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          children: [

            AmountBox(),

            SizedBox(height: 15,),

            TitleFiled(),

            SizedBox(height: 15,),

            CategorySection(),

          ],


        ),
      ),


    );
  }
}

