import 'package:base_flutter/pages/main_tab_bar/bottom_tab_bar_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'demo/first_view/first_view.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: BottomTabBarView.route,
      page: () => const BottomTabBarView(),
    ),
    GetPage(
      name: FirstView.route,
      page: () => const FirstView(),
    ),
  ];
}
