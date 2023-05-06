
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../view/demo/demo_binding.dart';
import '../view/demo/demo_screen.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: DemoScreen.router,
      page: () => const DemoScreen(),
      binding: DemoBinding()
      )
  ];
}
