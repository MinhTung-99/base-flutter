import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../dialog/dialog_loading.dart';

@injectable
class BaseViewModel extends GetxController{
  
  void showLoading() {
    DialogLoading.showLoading();
  }

  void hideLoading() {
    DialogLoading.hideLoading();
  }
}
