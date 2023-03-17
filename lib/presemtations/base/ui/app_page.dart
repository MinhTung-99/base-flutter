import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../view/login/login_view.dart';
import '../../view/register/register_view.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(name: LoginView.router, page: () => const LoginView()),
    GetPage(name: RegisterView.router, page: () => RegisterView()),
  ];
}
