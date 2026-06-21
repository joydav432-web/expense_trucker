class ExpenseModel {

   String title;
   String amount;
   String category;
   String date;
   String description;

  ExpenseModel({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.description,
  });


  Map<String,dynamic> toJson(){
    return {
      "title": title,
      "amount": amount,
      "category": category,
      "date": date,
      "description": description,
    };
  }


  factory ExpenseModel.fromJson(Map<String,dynamic> json){
    return ExpenseModel(
      title: json['title'],
      amount: json['amount'],
      category: json['category'],
      date: json['date'],
      description: json['description'],
    );
  }

}