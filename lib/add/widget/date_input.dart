import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInputExample extends StatefulWidget {
  const DateInputExample({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<DateInputExample> createState() => _DateInputExampleState();
}

class _DateInputExampleState extends State<DateInputExample> {


  void saveDate() {
    String text = widget.controller.text;

    try {
      DateTime date = DateFormat("dd/MM/yyyy").parseStrict(text);

      print("Saved Date: $date");


    } catch(e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid date! Use DD/MM/YYYY"),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text("DATE",
          style: TextTheme.of(context).labelLarge,
          ),
          const SizedBox(height: 10),

          TextField(
            controller: widget.controller,
            readOnly: true,
            decoration: InputDecoration(
              hintText: "Select Date",
              prefixIcon: const Icon(Icons.calendar_month),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 3,
                ),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 3,
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 3,
                ),
              ),
            ),

            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (pickedDate != null) {
                widget.controller.text =
                    DateFormat('dd/MM/yyyy').format(pickedDate);
              }
            },
          )
        ],
      ),
    );
  }
}