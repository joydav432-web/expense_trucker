
import 'package:flutter/material.dart';
class ShowTranscription extends StatelessWidget {
  const ShowTranscription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(
                color: Colors.grey,
                width: 3,
              ),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.restaurant,
                  color: Colors.white,
                ),
              ),

              title: const Text(
                "Aristen Kitchen",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("24 Jun 2026"),
                  Text(
                    "Dining",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              trailing: const Text(
                "৳500",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

