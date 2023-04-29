
import 'package:base_flutter/view/entry/entry_binding.dart';
import 'package:base_flutter/view/entry/entry_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: EntryScreen.router,
      page: () => const EntryScreen(),
      binding: EntryBinding()
      )
  ];
}
