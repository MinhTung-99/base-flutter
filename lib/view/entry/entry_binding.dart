import 'package:base_flutter/injection.dart';
import 'package:base_flutter/view/entry/entry_view_model.dart';
import 'package:get/get.dart';

class EntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntryViewModel>(
      () => getIt<EntryViewModel>(),
    );
  }
}
