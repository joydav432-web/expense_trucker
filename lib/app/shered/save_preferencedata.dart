import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../add/model/expenses_model.dart';


class ExpenseStorage{


  static Future<void> saveExpense(
      ExpenseModel expense
      ) async {


    final prefs = await SharedPreferences.getInstance();


    List<String> data =
        prefs.getStringList("expense") ?? [];


    data.add(
        jsonEncode(expense.toJson())
    );


    await prefs.setStringList(
        "expense",
        data
    );


  }



  static Future<List<ExpenseModel>> getExpense() async{


    final prefs =
    await SharedPreferences.getInstance();


    List<String> data =
        prefs.getStringList("expense") ?? [];


    return data.map((e){

      return ExpenseModel.fromJson(
          jsonDecode(e)
      );

    }).toList();


  }

  static Future<void> saveExpenseList(
      List<ExpenseModel> expenses
      ) async {

    final prefs =
    await SharedPreferences.getInstance();


    List<String> data = expenses.map((e){

      return jsonEncode(
        e.toJson(),
      );

    }).toList();


    await prefs.setStringList(
      "expense",
      data,
    );

  }





}