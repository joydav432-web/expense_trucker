import 'package:flutter/material.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<CategorySection> createState() => _CategorySectionState();
}


class _CategorySectionState extends State<CategorySection> {

  String selectedCategory = "Food";


  final List<Map<String, dynamic>> categories = [

    {
      "title": "Food",
      "icon": Icons.restaurant,
    },

    {
      "title": "Shopping",
      "icon": Icons.shopping_bag,
    },

    {
      "title": "Travel",
      "icon": Icons.flight,
    },

    {
      "title": "Bills",
      "icon": Icons.receipt_long,
    },

    {
      "title": "Health",
      "icon": Icons.health_and_safety,
    },

    {
      "title": "Others",
      "icon": Icons.more_horiz,
    },

  ];


  @override
  void initState() {
    super.initState();

    widget.controller.text = selectedCategory;
  }


  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [


        Text(
          "CATEGORY",
          style: Theme.of(context)
              .textTheme
              .labelLarge,
        ),


        const SizedBox(height: 10),


        SizedBox(

          height: 120,

          child: ListView.builder(

            scrollDirection: Axis.horizontal,

            itemCount: categories.length,


            itemBuilder: (context,index){


              bool isSelected =
                  selectedCategory ==
                      categories[index]["title"];



              return GestureDetector(

                onTap: (){

                  setState(() {

                    selectedCategory =
                    categories[index]["title"];

                    widget.controller.text =
                        selectedCategory;

                  });

                },


                child: Container(

                  width: 120,

                  margin:
                  const EdgeInsets.only(right: 12),


                  decoration: BoxDecoration(

                    borderRadius:
                    BorderRadius.circular(12),


                    gradient: LinearGradient(

                      colors: isSelected
                          ? [
                        Colors.blue,
                        Colors.blueAccent,
                      ]
                          : [
                        Colors.grey.shade300,
                        Colors.grey.shade100,
                      ],

                    ),

                  ),


                  child: Column(

                    mainAxisAlignment:
                    MainAxisAlignment.center,

                    children: [


                      Icon(

                        categories[index]["icon"],

                        size: 35,

                        color: isSelected
                            ? Colors.white
                            : Colors.black54,

                      ),


                      const SizedBox(height: 8),


                      Text(

                        categories[index]["title"],

                        style: TextStyle(

                          fontWeight:
                          FontWeight.bold,

                          color: isSelected
                              ? Colors.white
                              : Colors.black87,

                        ),

                      ),


                    ],
                  ),

                ),

              );

            },

          ),

        ),

      ],

    );

  }

}