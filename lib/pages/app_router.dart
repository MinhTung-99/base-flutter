
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'app_pages.dart';

class AppRouter {
  Route<dynamic>? route(RouteSettings settings) {
    Get.routing.args = settings.arguments;

    final route = AppPages.routes
        .firstWhereOrNull((element) => element.name == settings.name);
    if (route == null) {
      return null;
    }
    return GetPageRoute(
        page: route.page,
        settings: settings,
        routeName: route.name);
  }
}