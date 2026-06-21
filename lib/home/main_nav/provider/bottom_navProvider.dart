import 'package:flutter/material.dart';

class MainNavProvider extends ChangeNotifier {
  int _currentIndex = 0;
  String _transactionType = "Expense"; // Default

  int get currentIndex => _currentIndex;
  String get transactionType => _transactionType;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setTransactionType(String type) {
    _transactionType = type;
    notifyListeners();
  }
}
