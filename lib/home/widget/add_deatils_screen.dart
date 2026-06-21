import 'package:flutter/material.dart';

import '../../add/model/expenses_model.dart';


class ExpenseDetailsScreen extends StatefulWidget {

  const ExpenseDetailsScreen({
    super.key,
  });


  static const String name = '/desc';


  @override
  State<ExpenseDetailsScreen> createState() =>
      _ExpenseDetailsScreenState();

}



class _ExpenseDetailsScreenState
    extends State<ExpenseDetailsScreen> {


  ExpenseModel? expense;


  bool isEdit = false;


  late TextEditingController titleController;
  late TextEditingController descriptionController;



  @override
  void didChangeDependencies() {

    super.didChangeDependencies();


    if(expense == null){

      expense =
      ModalRoute.of(context)!
          .settings
          .arguments as ExpenseModel;


      titleController =
          TextEditingController(
            text: expense!.title,
          );


      descriptionController =
          TextEditingController(
            text: expense!.description,
          );

    }

  }




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


    if(expense == null){

      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );

    }



    return Scaffold(


      appBar: AppBar(

        title: const Text(
          "Expense Details",
        ),


        actions: [

          IconButton(

            onPressed: (){

              setState(() {

                isEdit = !isEdit;

              });

            },


            icon: Icon(

              isEdit
                  ? Icons.close
                  : Icons.edit,

            ),

          )

        ],

      ),




      body: Padding(

        padding:
        const EdgeInsets.all(16),


        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,


          children: [


            Row(

              children: [


                CircleAvatar(

                  radius: 30,

                  child: Icon(

                    getCategoryIcon(
                      expense!.category,
                    ),

                    size: 30,

                  ),

                ),



                const SizedBox(
                    width: 15
                ),



                Expanded(

                  child: isEdit

                      ? TextField(
                    controller:
                    titleController,
                  )


                      :

                  Text(

                    expense!.title,

                    style:
                    const TextStyle(

                      fontSize: 22,

                      fontWeight:
                      FontWeight.bold,

                    ),

                  ),

                )

              ],

            ),



            const SizedBox(height:20),




            Text(

              expense!.date,

              style:
              const TextStyle(
                color: Colors.grey,
              ),

            ),




            const SizedBox(height:20),




            isEdit

                ? TextField(

              controller:
              descriptionController,

              maxLines:5,

            )


                :

            Text(

              expense!.description,

              maxLines:5,

              overflow:
              TextOverflow.ellipsis,

              style:
              const TextStyle(
                fontSize:16,
              ),

            ),




            const Spacer(),




            Row(

              children: [


                Expanded(

                  child: ElevatedButton(

                    onPressed: (){

                      Navigator.pop(context);

                    },


                    child:
                    const Text(
                      "Back",
                    ),

                  ),

                ),



                const SizedBox(
                    width:15
                ),




                Expanded(

                  child: ElevatedButton(

                    onPressed: isEdit

                        ? (){


                      ExpenseModel updated =
                      ExpenseModel(

                        title:
                        titleController.text,

                        description:
                        descriptionController.text,

                        category:
                        expense!.category,

                        amount:
                        expense!.amount,

                        date:
                        expense!.date,

                      );


                      Navigator.pop(
                        context,
                        updated,
                      );


                    }

                        : null,


                    child:
                    const Text(
                      "Update",
                    ),

                  ),

                )

              ],

            )



          ],

        ),

      ),

    );

  }

}