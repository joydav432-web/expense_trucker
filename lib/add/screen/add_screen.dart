import 'package:expense_trucker/add/widget/add_description.dart';
import 'package:expense_trucker/add/widget/ammount_box.dart';
import 'package:expense_trucker/add/widget/cancel_button.dart';
import 'package:expense_trucker/add/widget/category_section.dart';
import 'package:expense_trucker/add/widget/date_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../home/main_nav/provider/bottom_navProvider.dart';
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
  final _formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final titleController = TextEditingController();
  final categoryController = TextEditingController();
  final dateController = TextEditingController();
  final descController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    titleController.dispose();
    categoryController.dispose();
    dateController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<MainNavProvider>(context);
    final transactionType = Provider.of<MainNavProvider>(context).transactionType;

    return Scaffold(
      appBar: AddScreenAppbar(type: transactionType),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AmountBox(controller: amountController),
                const SizedBox(height: 24),
                TitleField(
                  controller: titleController,
                ),
                const SizedBox(height: 24),
                CategorySection(controller: categoryController),
                const SizedBox(height: 24),
                DateInputExample(controller: dateController),
                const SizedBox(height: 24),
                AddDescription(controller: descController),
                const SizedBox(height: 32),
                SaveExpenses(
                  formKey: _formKey,
                  titleController: titleController,
                  amountController: amountController,
                  dateController: dateController,
                  descController: descController,
                  categoryController: categoryController,
                  type: transactionType,
                ),
                const SizedBox(height: 12),
                const CancelButton(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
