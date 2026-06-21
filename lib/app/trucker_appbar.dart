import 'package:expense_trucker/app/app_theme.dart';
import 'package:expense_trucker/app/providr/locale_provider.dart';
import 'package:expense_trucker/app/providr/theme_moodProvider.dart';
import 'package:expense_trucker/app/routes.dart';
import 'package:expense_trucker/app/splash_screen.dart';
import 'package:expense_trucker/home/main_nav/provider/bottom_navProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import '../l10n/app_localizations.dart';
import '../provider_for_save_data/save_provider.dart';

class ExpenseTrucker extends StatefulWidget {
  const ExpenseTrucker({super.key});

  @override
  State<ExpenseTrucker> createState() => _ExpenseTruckerState();
}

class _ExpenseTruckerState extends State<ExpenseTrucker> {
  final ThemeModeProvider _themeModeProvider = ThemeModeProvider();
  final LocaleModeProvider _localeModeProvider = LocaleModeProvider();
  

  @override
  void initState() {
    super.initState();

    _themeModeProvider.setDefaultThemeMode();
    _localeModeProvider.setDefaultLocale();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModeProvider>.value(
          value: _themeModeProvider,
        ),

        ChangeNotifierProvider<LocaleModeProvider>.value(
            value: _localeModeProvider),
        
        ChangeNotifierProvider(create: (_)=>MainNavProvider()),

        ChangeNotifierProvider(
            create:(_)=>ExpenseProvider()
              ..loadExpense()
        ),

      ],
      child: Consumer<ExpenseProvider>(
        builder: (context,expenseProvider,_) {
          return Consumer<LocaleModeProvider>(
            builder: (context,localeModeProvider,_) {
              return Consumer<ThemeModeProvider>(
                builder: (context,themeModeProvider,_) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    initialRoute: SplashScreen.name,
                    onGenerateRoute: AppRoutes.onGenarateRoute,
                    theme: AppTheme.lightTheme,
                    darkTheme: AppTheme.darkTheme,
                    themeMode:themeModeProvider.themeMode,


                    localizationsDelegates: [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],

                    supportedLocales:localeModeProvider.supportedLocal,

                    locale: localeModeProvider.currentLocal,

                  );
                }
              );
            }
          );
        }
      ),
    );
  }
}