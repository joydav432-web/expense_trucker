import 'package:expense_trucker/home/widget/add_deatils_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../add/model/expenses_model.dart';
import '../../provider_for_save_data/save_provider.dart';

class ShowTranscription extends StatefulWidget {
  const ShowTranscription({
    super.key,
  });

  @override
  State<ShowTranscription> createState() => _ShowTranscriptionState();
}

class _ShowTranscriptionState extends State<ShowTranscription> {
  IconData getCategoryIcon(String category, String type) {
    if (type == "Income") return Icons.account_balance_wallet;

    switch (category) {
      case "Food":
        return Icons.restaurant;
      case "Shopping":
        return Icons.shopping_bag;
      case "Travel":
        return Icons.flight;
      case "Bills":
        return Icons.receipt_long;
      case "Health":
        return Icons.health_and_safety;
      default:
        return Icons.more_horiz;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseProvider>(
      builder: (context, provider, child) {
        if (provider.expenses.isEmpty) {
          return const Center(
            child: Text(
              "No Transactions Found",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          );
        }

        return Expanded(
          child: ListView.builder(
            itemCount: provider.expenses.length,
            itemBuilder: (context, index) {
              final expense = provider.expenses[index];
              final isIncome = expense.type == "Income";

              return InkWell(
                onTap: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    ExpenseDetailsScreen.name,
                    arguments: expense,
                  );

                  if (result != null) {
                    setState(() {
                      provider.expenses[index] = result as ExpenseModel;
                    });
                  }
                },
                child: Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: isIncome ? Colors.green.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
                      child: Icon(
                        getCategoryIcon(expense.category, expense.type),
                        color: isIncome ? Colors.green : Colors.grey.shade700,
                      ),
                    ),
                    title: Text(
                      expense.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(expense.date),
                        if (expense.description.isNotEmpty)
                          Text(
                            expense.description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${isIncome ? '+' : '-'} ৳${expense.amount}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isIncome ? Colors.green : Colors.red,
                          ),
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {
                            provider.deleteExpense(expense);
                          },
                          child: const Icon(
                            Icons.delete_outline,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
