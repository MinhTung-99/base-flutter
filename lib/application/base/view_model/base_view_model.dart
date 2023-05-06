import 'package:base_flutter/resource/dialog/dialog_loading.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class BaseViewModel extends GetxController{
  
  void showLoading() {
    DialogLoading.showLoading();
  }

  void hideLoading() {
    DialogLoading.hideLoading();
  }
}
