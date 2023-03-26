import 'package:flutter/material.dart';

import '../app_color/app_color.dart';

class BohibaTheme {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: BohibaColors.primaryColor,

      scaffoldBackgroundColor: Colors.blue.shade50,
      fontFamily: 'Poppins',

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: BohibaColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ))
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
      ),

      appBarTheme: AppBarTheme(
          elevation: 0.5,
          backgroundColor: BohibaColors.bgColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            color: BohibaColors.secoundaryColor,
            fontWeight: FontWeight.w300,
            fontSize: 18,
            // fontStyle: FontStyle.italic
          ),
          iconTheme: IconThemeData(
              color: BohibaColors.primaryColor
          )
      ),

      iconTheme: IconThemeData(
        color: BohibaColors.primaryColor,
      ),

      listTileTheme: ListTileThemeData(
        iconColor: BohibaColors.primaryColor,
        tileColor: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide.none
        ),
      ),

      cardColor: Colors.grey.shade50,
      cardTheme: CardTheme(
          elevation: 0.5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          color: Colors.grey.shade50
      ),

      inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 12.0),
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: BohibaColors.primaryColor),
          ), errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: BohibaColors.primaryColor),
          )
      ),

      textTheme: TextTheme(
        displayLarge: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700
        ),
        displayMedium: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700
        ),
        displaySmall: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700
        ),

        headlineLarge: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700
        ),
        headlineMedium: TextStyle(
            fontSize: 18,
            color: BohibaColors.black,
            fontWeight: FontWeight.w600
        ),
        headlineSmall: TextStyle(
            fontSize: 16,
            color: BohibaColors.black,
            fontWeight: FontWeight.w600
        ),

        titleLarge: TextStyle(
          fontSize: 16,
          letterSpacing: 1.5,
          color: Colors.grey.shade400,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          letterSpacing: 1.7,
          color: Colors.grey.shade400,
        ),
        titleSmall: TextStyle(
          fontSize: 12,
          letterSpacing: 1.7,
          color: Colors.grey.shade400,
        ),

        bodyLarge: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600
        ),
        bodyMedium: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600
        ),
        bodySmall: const TextStyle(
          fontSize: 10,
        ),

        labelLarge: TextStyle(
            color: BohibaColors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600
        ),
        labelMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600 ,
            color: BohibaColors.black
        ),
        labelSmall: const TextStyle(
            fontSize: 9.5,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w700
        ),
      )
  );
}