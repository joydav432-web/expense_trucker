import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../home/main_nav/provider/bottom_navProvider.dart';
import '../../provider_for_save_data/save_provider.dart';
import '../model/expenses_model.dart';

class SaveExpenses extends StatelessWidget {
  const SaveExpenses({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.amountController,
    required this.dateController,
    required this.descController,
    required this.categoryController,
    required this.type,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController amountController;
  final TextEditingController dateController;
  final TextEditingController descController;
  final TextEditingController categoryController;
  final String type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () async {
          if (formKey.currentState?.validate() ?? false) {
            ExpenseModel expense = ExpenseModel(
              title: titleController.text,
              amount: amountController.text,
              category: categoryController.text,
              date: dateController.text,
              description: descController.text,
              type: type,
            );

            await Provider.of<ExpenseProvider>(
              context,
              listen: false,
            ).addExpense(expense);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("$type saved successfully"),
                backgroundColor: type == "Income" ? Colors.green : Colors.black,
              ),
            );

            Provider.of<MainNavProvider>(context, listen: false).changeIndex(0);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: type == "Income" ? Colors.green : Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        child: Text(
          "Save $type",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
