import 'package:expense_trucker/add/widget/add_description.dart';
import 'package:expense_trucker/add/widget/ammount_box.dart';
import 'package:expense_trucker/add/widget/cancel_button.dart';
import 'package:expense_trucker/add/widget/category_section.dart';
import 'package:expense_trucker/add/widget/date_input.dart';
import 'package:flutter/material.dart';
import '../widget/add_appbar.dart';
import '../widget/save_expenses.dart';
import '../widget/title_filed.dart';

class HomeAddScreen extends StatefulWidget {
  const HomeAddScreen({super.key});

  static const String name = '/add';

  @override
  State<HomeAddScreen> createState() => _HomeAddScreenState();
}

class _HomeAddScreenState extends State<HomeAddScreen> {


  final amountController = TextEditingController();
  final titleController = TextEditingController();
  final categoryController = TextEditingController();
  final dateController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AddScreenAppbar(),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
        
            children: [
        
              AmountBox(controller: amountController,),
        
              SizedBox(height: 20,),
        
              TitleFiled(controller: titleController,),
        
        
              CategorySection(controller: categoryController,),
              SizedBox(height: 20,),
        
              DateInputExample(controller: dateController,),
        
              SizedBox(height: 20,),
        
              AddDescription(controller: descController),

              SizedBox(height: 20,),

              SaveExpenses(titleController: titleController,
                  amountController: amountController,
                  dateController: dateController,
                  descController: descController,
                  categoryController: categoryController),

              const SizedBox(height: 10,),

              CanceButton()





            ],
        
        
          ),
        ),
      ),


    );
  }
}

