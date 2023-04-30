
import 'package:flutter/cupertino.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    required this.mobile,
    required this.tablet,
    Key? key,
  }) : super(key: key);
  final Widget mobile;
  final Widget tablet;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650;

  @override
  Widget build(BuildContext context) {
    if (isTablet(context)) {
      return tablet;
    } else {
      return mobile;
    }
  }
}