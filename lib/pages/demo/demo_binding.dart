import 'package:base_flutter/injection.dart';
import 'package:get/get.dart';

import 'demo_view_model.dart';

class DemoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoViewModel>(
      () => getIt<DemoViewModel>(),
    );
  }
}
