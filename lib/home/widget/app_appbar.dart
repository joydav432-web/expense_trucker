
import 'package:expense_trucker/app/app_theme.dart';
import 'package:expense_trucker/home/widget/appbar_widget.dart';
import 'package:flutter/material.dart';

import '../../app/assetsImage_path.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget{
  const AppAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8,right: 8),
      child: AppBar(




        leading: GestureDetector(
            onTap: (){},
          child: CircleAvatar(
            backgroundImage: AssetImage(ImagePath.profileImage),
            radius: 30,
          ),
        ),

        title: Text("Financial Clarity",style: TextTheme.of(context).headlineMedium,),

        actions: [
          AppbarIcon(onTap: (){},
              icon: Icons.notifications_active)

        ],


      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
