import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providr/theme_moodProvider.dart';

class ChangeTheme extends StatelessWidget {
  const ChangeTheme({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ActionSlider.standard(
        height: 50,
        backgroundColor: isDark ? Colors.black54 : Colors.white,
        toggleColor: isDark ? Colors.amber : Colors.indigo,
        icon: Icon(
          isDark ? Icons.light_mode : Icons.dark_mode,
          color: Colors.white,
        ),
        child: Text(
          isDark ? 'Slide for Light Mode' : 'Slide for Dark Mode',
          style: TextStyle(color: isDark ? Colors.white : Colors.black87),
        ),
        action: (controller) async {
          controller.loading();

          await Future.delayed(const Duration(milliseconds: 500));

          // Use the provider from context instead of creating a new instance
          final themeProvider = Provider.of<ThemeModeProvider>(context, listen: false);

          if (isDark) {
            themeProvider.changeThemeMode(ThemeMode.light);
          } else {
            themeProvider.changeThemeMode(ThemeMode.dark);
          }

          controller.success();

          await Future.delayed(const Duration(seconds: 1));
          controller.reset();
        },
      ),
    );
  }
}
