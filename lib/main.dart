
import 'package:abccccc1233/presemtations/base/ui/app_page.dart';
import 'package:abccccc1233/presemtations/view/login/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lifecycle/lifecycle.dart';

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
        navigatorObservers: [defaultLifecycleObserver],
        getPages: AppPages.routes,
        initialRoute: LoginView.router);
  }
}
