
import 'package:flutter/material.dart';
class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {

  int selectedIndex = 0;

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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "CATEGORY",
          style: Theme.of(context).textTheme.labelLarge,
        ),

        const SizedBox(height: 10),

        SizedBox(
          height: 120,
          child: ListView.builder(

            scrollDirection: Axis.horizontal,

            itemCount: categories.length,

            itemBuilder: (context,index){

              bool isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: (){
                  setState(() {
                    selectedIndex = index;
                  });
                },

                child: Container(
                  width: 120,
                  margin: const EdgeInsets.only(right: 12),

                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(12),

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
                    mainAxisAlignment: MainAxisAlignment.center,

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
                          fontWeight: FontWeight.bold,
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