import 'package:flutter/material.dart';

class AddScreenAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AddScreenAppbar({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "NEW ${type.toUpperCase()}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Row(
            children: [
              Icon(
                Icons.check_circle,
                size: 16,
                color: Colors.green,
              ),
              SizedBox(width: 4),
              Text(
                "DRAFT SAVED",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
