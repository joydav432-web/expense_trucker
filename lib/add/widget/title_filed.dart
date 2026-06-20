import 'package:flutter/material.dart';

class TitleFiled extends StatelessWidget {
  const TitleFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          'EXPENSE TITLE',
          style: Theme.of(context).textTheme.labelLarge,
        ),

        const SizedBox(height: 5),

        SizedBox(
          width: 450,
          height: 80,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Expense title required";
              }
              return null;
            },

            decoration: InputDecoration(

              hintText: "Enter expense title",
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),

              prefixIcon: const Icon(
                Icons.edit_note,
                color: Colors.grey,
              ),

              filled: false,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2,
                ),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2,
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
            ),
          ),
        )

      ],
    );
  }
}

