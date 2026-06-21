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
  State<ShowTranscription> createState() =>
      _ShowTranscriptionState();

}



class _ShowTranscriptionState
    extends State<ShowTranscription> {


  IconData getCategoryIcon(String category){

    switch(category){

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

      builder: (context, provider, child){


        if(provider.expenses.isEmpty){

          return const Center(

            child: Text(
              "No Expense Found",
              style: TextStyle(
                fontSize: 18,
              ),
            ),

          );

        }



        return Expanded(

          child: ListView.builder(

            itemCount: provider.expenses.length,


            itemBuilder: (context,index){


              final expense =
              provider.expenses[index];



              return InkWell(
                onTap: () async {

                  final result = await Navigator.pushNamed(
                    context,
                    ExpenseDetailsScreen.name,
                    arguments: expense,
                  );


                  if(result != null){

                    setState((){

                      provider.expenses[index] =
                      result as ExpenseModel;

                    });

                  }

                },
                child: Card(

                  margin:
                  const EdgeInsets.only(bottom: 10),


                  elevation: 4,


                  child: ListTile(


                    leading: CircleAvatar(

                      backgroundColor:
                      Colors.grey,


                      child: Icon(

                        getCategoryIcon(
                          expense.category,
                        ),

                        color: Colors.white,

                      ),

                    ),



                    title: Text(

                      expense.title,

                      style:
                      const TextStyle(

                        fontWeight:
                        FontWeight.bold,

                      ),

                    ),



                    subtitle: Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,


                      children: [


                        Text(
                          expense.date,
                        ),



                        Text(

                          expense.description,

                          maxLines: 1,

                          overflow:
                          TextOverflow.ellipsis,

                          style:
                          const TextStyle(
                            color: Colors.grey,
                          ),

                        ),

                      ],

                    ),



                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(
                          "৳${expense.amount}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),


                        GestureDetector(

                          onTap: (){

                            provider.deleteExpense(expense);

                          },


                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 22,
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