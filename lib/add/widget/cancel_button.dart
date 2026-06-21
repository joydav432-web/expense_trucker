import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/main_nav/provider/bottom_navProvider.dart';

class CanceButton extends StatelessWidget {
  const CanceButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 450,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          Provider.of<MainNavProvider>
            (context,listen: false).changeIndex(0);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          elevation: 0,
        ),
        child: const Text(
          "Cancel",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

