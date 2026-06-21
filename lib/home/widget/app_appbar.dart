import 'dart:io';
import 'package:expense_trucker/app/providr/user_provider.dart';
import 'package:expense_trucker/home/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: AppBar(
        leading: Consumer<UserProvider>(
          builder: (context, userProvider, _) {
            return GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                backgroundImage: userProvider.profileImagePath != null
                    ? FileImage(File(userProvider.profileImagePath!))
                    : null,
                radius: 30,
                child: userProvider.profileImagePath == null
                    ? const Icon(Icons.person, color: Colors.grey)
                    : null,
              ),
            );
          },
        ),
        title: Text(
          "Financial Clarity",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          AppbarIcon(onTap: () {}, icon: Icons.notifications_active)
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
