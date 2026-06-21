import 'package:flutter/material.dart';

import '../add/model/expenses_model.dart';
import '../app/shered/save_preferencedata.dart';


class ExpenseProvider extends ChangeNotifier{


  List<ExpenseModel> expenses=[];



  Future<void> addExpense(
      ExpenseModel expense
      ) async{


    await ExpenseStorage.saveExpense(expense);


    expenses.add(expense);


    notifyListeners();


  }

  Future<void> deleteExpense(
      ExpenseModel expense
      ) async {


    expenses.remove(expense);


    await ExpenseStorage.saveExpenseList(
        expenses
    );


    notifyListeners();

  }

  Future<void> loadExpense() async{


    expenses =
    await ExpenseStorage.getExpense();


    notifyListeners();

  }



}