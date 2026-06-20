
import 'package:flutter/material.dart';
class AppbarIcon extends StatelessWidget {
  const AppbarIcon({
    super.key, required this.onTap, required this.icon,
  });

  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 16,
        child: Icon(icon,

          size: 25,
        ),
      ),
    );
  }
}