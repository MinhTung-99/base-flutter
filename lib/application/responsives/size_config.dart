
import 'dart:io';

import 'package:base_flutter/application/responsives/responsive.dart';
import 'package:flutter/cupertino.dart';

class SizeConfig {
  SizeConfig._();

  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }

  // Get the proportionate height as per screen size
  static double getHeight(
      {double heightPhone = 0,
        double heightTablet = 0,
        required BuildContext context}) {
    if (Platform.isWindows) {
      return heightTablet;
    }

    // 812 for iphone, 834.0 for tablet is the layout height that designer use
    if (Responsive.isTablet(context)) {
      if (_canResponsive()) {
        return heightTablet;
      }
      return (heightTablet / 834.0) * screenHeight;
    }
    return (heightPhone / 812.0) * screenHeight;
  }

// Get the proportionate height as per screen size
  static double getWidth(
      {double widthPhone = 0,
        double widthTablet = 0,
        required BuildContext context}) {
    if (Platform.isWindows) {
      return widthTablet;
    }
    // 375 for iphone, 1194 for tablet is the layout width that designer use
    if (Responsive.isTablet(context)) {
      return (widthTablet / 1194.0) * screenWidth;
    }
    return (widthPhone / 375.0) * screenWidth;
  }

  static bool _canResponsive() {
    //  màn hình này quá nhỏ rồi, nên k cần check nữa
    return (screenHeight <= 0.7 * 834.0) || (screenWidth < 1 * 1194.0);
  }

  static double viewPaddingBottom(BuildContext context){
    return MediaQuery.of(context).viewPadding.bottom;
  }
}