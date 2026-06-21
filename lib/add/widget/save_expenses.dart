
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/main_nav/provider/bottom_navProvider.dart';
import '../../provider_for_save_data/save_provider.dart';
import '../model/expenses_model.dart';
class SaveExpenses extends StatelessWidget {
  const SaveExpenses({
    super.key,
    required this.titleController,
    required this.amountController,
    required this.dateController,
    required this.descController,
    required this.categoryController,
  });

  final TextEditingController titleController;
  final TextEditingController amountController;
  final TextEditingController dateController;
  final TextEditingController descController;
  final TextEditingController categoryController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 450,
      height: 60,
      child: ElevatedButton(
        onPressed: () async {

          if (titleController.text.isEmpty ||
              amountController.text.isEmpty ||
              dateController.text.isEmpty||
              descController.text.isEmpty||
              categoryController.text.isEmpty
          ) {

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Please filled all form"),
              ),
            );

            return;
          }


          ExpenseModel expense = ExpenseModel(
            title: titleController.text,
            amount: amountController.text,
            category: categoryController.text,
            date: dateController.text,
            description: descController.text,
          );


          await Provider.of<ExpenseProvider>(
            context,
            listen: false,
          ).addExpense(expense);


          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Expense saved"),
            ),
          );

          Provider.of<MainNavProvider>(context,listen: false).changeIndex(0);

        },style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
        child: const Text(
          "Save Expense",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

