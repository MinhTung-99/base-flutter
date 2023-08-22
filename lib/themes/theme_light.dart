
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF1F1F1),
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        background: Color(0xFFFFFFFF),
        onBackground: Color(0xFFFFFFFF),
        surface: Color(0xFFFFFFFF),
        onSurface: Color(0xFFFFFFFF),
        error: Color(0xFFE82D3B),
        onError: Color(0xFFE82D3B),
        errorContainer: Color(0xFFE82D3B),
        onErrorContainer: Color(0xFFE82D3B),
        primary: Color(0xFF3D4C74),
        onPrimary: Color(0xFF3D4C74),
        secondary: Color(0xFFF1F1F1),
        onSecondary: Color(0xFFF1F1F1),
        secondaryContainer: Color(0xFFC3C3C3)),
    // Define the default font family.
 /*   fontFamily: Font.NOTO_SANS,*/

    // Define the default `TextTheme`. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    buttonTheme: const ButtonThemeData(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
            /*fontFamily: Font.NOTO_SANS,*/ fontWeight: FontWeight.bold, fontSize: 14)),
        backgroundColor:
        MaterialStateProperty.all<Color>(const Color(0xFF3D4C74)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<StadiumBorder>(const StadiumBorder()),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
            /*fontFamily: Font.NOTO_SANS,*/ fontWeight: FontWeight.bold, fontSize: 14)),
        backgroundColor:
        MaterialStateProperty.all<Color>(const Color(0xFF3D4C74)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<StadiumBorder>(const StadiumBorder()),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
            /*fontFamily: Font.NOTO_SANS,*/ fontWeight: FontWeight.bold, fontSize: 14)),
        backgroundColor:
        MaterialStateProperty.all<Color>(const Color(0xFF3D4C74)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<StadiumBorder>(const StadiumBorder()),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 17,
          //fontFamily: Font.NOTO_SANS,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
          height: 1.3,
          color: Color(0xFF030303)), //bold
      titleMedium: TextStyle(
          fontSize: 15,
          //fontFamily: Font.NOTO_SANS,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
          height: 1.3,
          color: Color(0xFF030303)),
      titleSmall: TextStyle(
          fontSize: 11,
          //fontFamily: Font.NOTO_SANS,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
          height: 1.3,
          color: Color(0xFF030303)),//bold
      bodyLarge: TextStyle(
          fontSize: 15,
          //fontFamily: Font.NOTO_SANS,
          fontWeight: FontWeight.w500, //medium
          letterSpacing: 0.8,
          height: 1.3,
          color: Color(0xFF6D6D72)),
      bodyMedium: TextStyle(
          fontSize: 11,
          //fontFamily: Font.NOTO_SANS,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.8,
          height: 1.3,
          color: Color(0xFF6D6D72)), // medium
      bodySmall: TextStyle(
          fontSize: 11,
          //fontFamily: Font.NOTO_SANS,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.8,
          height: 1.3,
          color: Color(0xFFC3C3C3)), // medium
    ),
    dividerColor: const Color(0xFFEDF2FE),
    dividerTheme: const DividerThemeData(
      color: Color(0xFFEDF2FE),
      // this.space,
      thickness: 1,
      indent: 0,
      endIndent: 0,
    ));