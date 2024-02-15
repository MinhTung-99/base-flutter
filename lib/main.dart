import 'dart:async';

import 'package:base_flutter/pages/app_router.dart';
import 'package:base_flutter/pages/main_tab_bar/bottom_tab_bar_view.dart';
import 'package:base_flutter/themes/theme_blue.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lifecycle/lifecycle.dart';
import 'injection.dart';

void mainCommon() {
  configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  late final StreamSubscription<ConnectivityResult>? networkSubscription;
  late Future<ConnectivityResult> _connection;
  final _router = AppRouter();

  @override
  void initState() {
    super.initState();
    _connection = checkNetworkConnection();
  }

  Future<ConnectivityResult> checkNetworkConnection() async {
    final connectivity = Connectivity();
    networkSubscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      //StoreAdmin.networkStatus(result);
      print('NET_WORK====$result');
    });
    return connectivity.checkConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ConnectivityResult>(
      future: _connection,
      builder:
          (BuildContext context, AsyncSnapshot<ConnectivityResult> snapshot) {
        if (snapshot.hasData) {
          return OrientationBuilder(builder: (context, orientation) {
            return Portal(
                child: GetMaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: blueTheme,
                    darkTheme: blueTheme,
                    builder: FlutterSmartDialog.init(),
                    navigatorObservers: [defaultLifecycleObserver],
                    onGenerateRoute: _router.route,
                    initialRoute: BottomTabBarView.route));
          });
        } else {
          return Container(
            color: const Color(0xFFE5E5E5),
          );
        }
      },
    );
  }
}
