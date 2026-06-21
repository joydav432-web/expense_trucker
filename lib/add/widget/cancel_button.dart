import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../home/main_nav/provider/bottom_navProvider.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
    required this.amountController,
    required this.titleController,
    required this.categoryController,
    required this.dateController,
    required this.descController,
  });

  final TextEditingController amountController;
  final TextEditingController titleController;
  final TextEditingController categoryController;
  final TextEditingController dateController;
  final TextEditingController descController;

  void _clearAll() {
    amountController.clear();
    titleController.clear();
    categoryController.clear();
    dateController.clear();
    descController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          _clearAll();
          Provider.of<MainNavProvider>(context, listen: false).changeIndex(0);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Colors.black12, width: 1),
          ),
        ),
        child: const Text(
          "Cancel",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
