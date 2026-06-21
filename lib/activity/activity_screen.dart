import 'package:expense_trucker/home/screen/show_transcription.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider_for_save_data/save_provider.dart';

class ActivityScreen extends StatelessWidget {


  const ActivityScreen({super.key});

  static const String name = '/name';

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Activity"),
      ),

      body: Consumer<ExpenseProvider>(
        builder: (context, provider, child) {

          if(provider.expenses.isEmpty){
            return const Center(
              child: Text(
                "No Transcription",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(12),
            child: ShowTranscription(),
          );

        },
      ),

    );
  }
}