import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class AddDescription extends StatefulWidget {
  const AddDescription({super.key, required this.controller});

   final TextEditingController ?controller;


  @override
  State<AddDescription> createState() => _AddDescriptionState();
}

class _AddDescriptionState extends State<AddDescription> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text("NOTE/DESCRIPTION",style: TextTheme.of(context).labelLarge,),

        SizedBox(height: 10,),
        
        
        TextFormField(
          controller:widget.controller ,
          maxLines: 4,
          textInputAction: TextInputAction.done,

          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Please enter a description";
            }

            if (value.trim().length < 5) {
              return "Description must be at least 5 characters";
            }

            return null;
          },

          decoration: InputDecoration(
            labelText: "Description",
            hintText: "Enter description",

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 3,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 3,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 3,
              ),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 3,
              ),
            ),
          ),
        )
      ],
    );
  }
}
