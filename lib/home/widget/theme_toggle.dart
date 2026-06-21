import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/providr/theme_moodProvider.dart';


class ThemeToggle extends StatefulWidget {

  const ThemeToggle({super.key});

  @override
  State<ThemeToggle> createState() =>
      _ThemeToggleState();

}



class _ThemeToggleState extends State<ThemeToggle> {


  @override
  Widget build(BuildContext context) {


    return Consumer<ThemeModeProvider>(

      builder: (context, themeProvider, _) {


        bool isDark =
            themeProvider.themeMode == ThemeMode.dark;



        return ActionSlider.standard(


          height: 50,


          backgroundColor:
          isDark
              ? Colors.black54
              : Colors.white,


          toggleColor:
          isDark
              ? Colors.amber
              : Colors.indigo,



          icon: Icon(

            isDark
                ? Icons.light_mode
                : Icons.dark_mode,

            color: Colors.white,

          ),



          child: Text(

            isDark
                ? "Slide for Light Mode"
                : "Slide for Dark Mode",

            style: TextStyle(

              color: isDark
                  ? Colors.white
                  : Colors.black87,

            ),

          ),



          action: (controller) async {


            controller.loading();


            await Future.delayed(
              const Duration(
                milliseconds: 500,
              ),
            );



            if(isDark){

              themeProvider.changeThemeMode(
                ThemeMode.light,
              );

            }else{

              themeProvider.changeThemeMode(
                ThemeMode.dark,
              );

            }



            controller.success();


            await Future.delayed(
              const Duration(seconds:1),
            );


            controller.reset();


          },

        );

      },

    );

  }

}