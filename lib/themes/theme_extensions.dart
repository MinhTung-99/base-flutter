import 'package:flutter/material.dart';

class FlutterTheme extends ThemeExtension<FlutterTheme> {
  const FlutterTheme({
    this.primaryColor = Colors.white,
    this.gradientColorLight01 = Colors.white,
    this.gradientColorLight02 = Colors.white,
    this.gradientColorDark02 = Colors.white,
    this.menuColor = Colors.white,
    this.primaryBorderColor = Colors.white,
    this.appbarColor = Colors.white,
    this.textColor = Colors.white,
    this.borderColor = Colors.white,
    this.errorColor = Colors.white,
    this.hintColor = Colors.white,
    this.requireColor = Colors.white,
    this.colorBorderGrey = Colors.white,
    this.lineTopColor = Colors.white,
  });

  final Color primaryColor;
  final Color gradientColorLight01;
  final Color gradientColorLight02;
  final Color gradientColorDark02;
  final Color menuColor;
  final Color primaryBorderColor;
  final Color appbarColor;
  final Color textColor;
  final Color borderColor;
  final Color errorColor;
  final Color hintColor;
  final Color requireColor;
  final Color colorBorderGrey;

  final Color lineTopColor;

  @override
  FlutterTheme copyWith() {
    return FlutterTheme(
        primaryColor: primaryColor,
        gradientColorLight01: gradientColorLight01,
        gradientColorLight02: gradientColorLight02,
        gradientColorDark02: gradientColorDark02,
        menuColor: menuColor,
        primaryBorderColor: primaryBorderColor,
        appbarColor: appbarColor,
        textColor: textColor,
        borderColor: borderColor,
        errorColor: errorColor,
        hintColor: hintColor,
        requireColor: requireColor,
        colorBorderGrey: colorBorderGrey,
        lineTopColor: lineTopColor);
  }

  @override
  ThemeExtension<FlutterTheme> lerp(
      covariant ThemeExtension<FlutterTheme>? other, double t) {
    if (other is! FlutterTheme) {
      return this;
    }
    return FlutterTheme(
      primaryColor:
          Color.lerp(primaryColor, other.primaryColor, t) ?? Colors.white,
      gradientColorLight01:
          Color.lerp(gradientColorLight01, other.gradientColorLight01, t) ??
              Colors.white,
      gradientColorLight02:
          Color.lerp(gradientColorLight02, other.gradientColorLight02, t) ??
              Colors.white,
      gradientColorDark02:
          Color.lerp(gradientColorDark02, other.gradientColorDark02, t) ??
              Colors.white,
      menuColor: Color.lerp(menuColor, other.menuColor, t) ?? Colors.white,
      primaryBorderColor:
          Color.lerp(primaryBorderColor, other.primaryBorderColor, t) ??
              Colors.white,
      appbarColor:
          Color.lerp(appbarColor, other.appbarColor, t) ?? Colors.white,
      textColor: Color.lerp(textColor, other.textColor, t) ?? Colors.white,
      borderColor:
          Color.lerp(borderColor, other.borderColor, t) ?? Colors.white,
      errorColor: Color.lerp(errorColor, other.errorColor, t) ?? Colors.white,
      hintColor: Color.lerp(hintColor, other.hintColor, t) ?? Colors.white,
      requireColor:
          Color.lerp(requireColor, other.requireColor, t) ?? Colors.white,
      colorBorderGrey:
          Color.lerp(colorBorderGrey, other.colorBorderGrey, t) ?? Colors.white,
      lineTopColor:
          Color.lerp(lineTopColor, other.lineTopColor, t) ?? Colors.white,
    );
  }
}
