class ExpenseModel {
  String title;
  String amount;
  String category;
  String date;
  String description;
  String type; // "Income" or "Expense"

  ExpenseModel({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.description,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "amount": amount,
      "category": category,
      "date": date,
      "description": description,
      "type": type,
    };
  }

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      title: json['title'],
      amount: json['amount'],
      category: json['category'],
      date: json['date'],
      description: json['description'],
      type: json['type'] ?? "Expense",
    );
  }
}
