import 'package:base_flutter/themes/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/app_fonts.dart';
import '../pages/widgets/custom_splash_button.dart';

const backgroundColor = Colors.white;
const backgroundAppbarColor = Colors.blue;
const primaryColor = Colors.blue;
const onPrimaryColor = Color(0xFF666666);
const gradientColorLight01 = Color(0xFFFFFFFF);
const gradientColorLight02 = Color(0xFFDCF4FF);
const gradientColorDark02 = Color(0xFF1C96FF);
const menuColor = Color(0xFF338EDD);
const headerColor = Color(0xFF52AFFF);
const appbarColor = Color(0xFF47C5FF);
const textColor = Colors.black;
const borderColor = Color(0xFF999999);
const errorColor = Color(0xFFE82D3B);
const requireColor = Color(0xFFFB3317);
const hintColor = Color(0xFF999999);
const lineTopColor = Color(0xFFFFC95E);
const backgroundImageEmptyColor = Color(0xFFE5E5E5);
const colorBorderGrey = Color(0xFFCCCCCC);

const _secondaryColor = Color(0xFFFFFFFF);
const _surfaceColor = Color(0xFFFFC95E);
const _onSurfaceColor = Color(0xFF666666);
const _buttonPressedBackground = Color(0xFF1C96FF);

FlutterTheme blueFlutterTheme = const FlutterTheme(
    primaryColor: primaryColor,
    gradientColorLight01: gradientColorLight01,
    gradientColorLight02: gradientColorLight02,
    gradientColorDark02: gradientColorDark02,
    menuColor: menuColor,
    primaryBorderColor: headerColor,
    appbarColor: appbarColor,
    textColor: textColor,
    borderColor: borderColor,
    errorColor: errorColor,
    hintColor: hintColor,
    requireColor: requireColor,
    lineTopColor: lineTopColor);

final blueTheme = ThemeData(
  switchTheme: SwitchThemeData(
    trackOutlineColor: const MaterialStatePropertyAll(Colors.transparent),
    trackOutlineWidth: MaterialStateProperty.all(0),
    splashRadius: 0,
    thumbColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.white;
      }
      return Colors.white;
    }),
    trackColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }
        return colorBorderGrey;
      },
    ),
  ),
  brightness: Brightness.light,
  scaffoldBackgroundColor: backgroundColor,
  inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      labelStyle: const TextStyle(color: borderColor),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: errorColor),
          borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(10)),
      hintStyle: const TextStyle(
          color: borderColor,
          fontFamily: Font.sourceHanSansJP,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          height: 1.6)),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
        fontSize: 17,
        fontFamily: Font.sourceHanSansJP,
        fontWeight: FontWeight.w700),
    backgroundColor: backgroundAppbarColor,
    foregroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light, /// For Android (light icons)
      statusBarBrightness: Brightness.light, /// For iOS (light icons)
    ),
  ),
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xFFFFFFFF),
      surface: _surfaceColor,
      onSurface: _onSurfaceColor,
      // color of text when opening default dialog
      error: errorColor,
      onError: errorColor,
      errorContainer: errorColor,
      onErrorContainer: errorColor,
      primary: primaryColor,
      onPrimary: onPrimaryColor,
      //Main text color when opening default dialog
      outline: borderColor,
      secondary: _secondaryColor,
      onSecondary: _secondaryColor,
      secondaryContainer: borderColor),
  // Define the default font family.
  fontFamily: Font.sourceHanSansJP,

  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  buttonTheme: const ButtonThemeData(),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      //splashFactory: CustomSplashButton.splashFactory,
      textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
        fontFamily: Font.sourceHanSansJP,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      )),
      minimumSize: MaterialStateProperty.all<Size>(const Size(100, 36)),
      maximumSize: MaterialStateProperty.all<Size>(const Size(300, 300)),
      // side: MaterialStateProperty.resolveWith<BorderSide>(
      //   (Set<MaterialState> states) {
      //     if (states.contains(MaterialState.disabled)) {
      //       return BorderSide(color: primaryColor.withOpacity(0.5), width: 2);
      //     }
      //     return const BorderSide(
      //         color: primaryColor, width: 2); // Use the component's default.
      //   },
      // ),
      backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
      foregroundColor: MaterialStateProperty.resolveWith<Color>( ///Text color
        (Set<MaterialState> states) {
          // if (states.contains(MaterialState.disabled)) {
          //   return Colors.white.withOpacity(0.5);
          // }
          return Colors.white; // Use the component's default.
        },
      ),
      shape: MaterialStateProperty.all<StadiumBorder>(const StadiumBorder()),
      // overlayColor: MaterialStateProperty.resolveWith<Color>(
      //   (Set<MaterialState> states) {
      //     if (states.contains(MaterialState.pressed)) {
      //       return _buttonPressedBackground;
      //     }
      //     return Colors.transparent;
      //   },
      // ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      splashFactory: CustomSplashButton.splashFactory,
      textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
          fontFamily: Font.sourceHanSansJP,
          fontWeight: FontWeight.bold,
          fontSize: 14)),
      // side: MaterialStateProperty.all<BorderSide>(
      //     const BorderSide(color: Color(0xFFC3C3C3), width: 1)),
      side: MaterialStateProperty.resolveWith<BorderSide>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(
                color: const Color(0xFFC3C3C3).withOpacity(0.5), width: 2);
          }
          return const BorderSide(
              color: Color(0xFFC3C3C3),
              width: 2); // Use the component's default.
        },
      ),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      // foregroundColor:
      //     MaterialStateProperty.all<Color>(const Color(0xFFFFA1C2)),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return const Color(0xFFFFA1C2).withOpacity(0.5);
          }
          return const Color(0xFFFFA1C2); // Use the component's default.
        },
      ),
      shape: MaterialStateProperty.all<StadiumBorder>(const StadiumBorder()),
      overlayColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return _buttonPressedBackground;
          }
          return Colors.transparent;
        },
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      splashFactory: CustomSplashButton.splashFactory,
      textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
          fontFamily: Font.sourceHanSansJP,
          fontWeight: FontWeight.bold,
          fontSize: 14)),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.white.withOpacity(0.5);
          }
          return Colors.white; // Use the component's default.
        },
      ),
      // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),// mau cua text button dialog mac dinh he thong
      // shape: MaterialStateProperty.all<StadiumBorder>(const StadiumBorder()),
      overlayColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return _buttonPressedBackground;
          }
          return Colors.transparent;
        },
      ),
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontSize: 17,
        fontFamily: Font.sourceHanSansJP,
        fontWeight: FontWeight.bold,
        // letterSpacing: 0.8,
        height: 1.3,
        color: textColor),
    titleMedium: TextStyle(
        fontSize: 15,
        fontFamily: Font.sourceHanSansJP,
        fontWeight: FontWeight.w500,
        // letterSpacing: 0.3,
        height: 1.3,
        color: textColor),
    // medium
    titleSmall: TextStyle(
        fontSize: 15,
        fontFamily: Font.sourceHanSansJP,
        fontWeight: FontWeight.w500,
        //letterSpacing: 0.8,
        height: 1.2,
        color: textColor),
    // medium
    labelLarge: TextStyle(
        fontSize: 17,
        fontFamily: Font.sourceHanSansJP,
        fontWeight: FontWeight.bold,
        // letterSpacing: 0.8,
        height: 1.3,
        color: textColor),
    // bold
    //bold
    labelMedium: TextStyle(
        fontSize: 15,
        fontFamily: Font.sourceHanSansJP,
        fontWeight: FontWeight.w500,
        // letterSpacing: 0.3,
        height: 1.3,
        color: textColor),
    // medium
    labelSmall: TextStyle(
        fontSize: 11,
        fontFamily: Font.sourceHanSansJP,
        fontWeight: FontWeight.w500,
        //letterSpacing: 0.8,
        height: 1.2,
        color: textColor),
    bodyLarge: TextStyle(
        fontSize: 17,
        fontFamily: Font.sourceHanSansJP,
        fontWeight: FontWeight.w400,
        // letterSpacing: 0.8,
        height: 1.3,
        color: textColor),
    //regular
    bodyMedium: TextStyle(
        fontSize: 15,
        fontFamily: Font.sourceHanSansJP,
        fontWeight: FontWeight.w400,
        // letterSpacing: 0.8,
        height: 1.3,
        color: textColor),
    // regular
    bodySmall: TextStyle(
        fontSize: 11,
        fontFamily: Font.sourceHanSansJP,
        fontWeight: FontWeight.w400,
        // letterSpacing: 0.8,
        height: 1.3,
        color: textColor), //regular
  ),
  dividerColor: borderColor,
  dividerTheme: const DividerThemeData(
    color: borderColor,
    thickness: 1,
    indent: 0,
    endIndent: 0,
  ),
  extensions: [blueFlutterTheme],
  menuButtonTheme: const MenuButtonThemeData(
      style: ButtonStyle(
    splashFactory: CustomSplashButton.splashFactory,
    backgroundColor: MaterialStatePropertyAll(Colors.cyan)
    // textStyle: MaterialStatePropertyAll(TextStyle(
    //     fontSize: 15,
    //     fontFamily: Font.sourceHanSansJP,
    //     fontWeight: FontWeight.bold,
    //     color: Colors.white)),
  )),
  datePickerTheme: DatePickerThemeData(
      backgroundColor: Colors.white,
      cancelButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return primaryColor.withOpacity(0.5);
            }
            return primaryColor; // Use the component's default.
          },
        ),
      ),
      confirmButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return primaryColor.withOpacity(0.5);
            }
            return primaryColor; // Use the component's default.
          },
        ),
      )),
);
