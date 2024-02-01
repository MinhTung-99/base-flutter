
import 'package:base_flutter/helpers/base/view_model/base_view_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../widgets/poup_menu_widgets/popup_menu_widget.dart';

class FirstViewModel extends BaseViewModel {

  final Rx<List<MenuItem>> menuItems = Rx([]);

  @override
  void onInit() {
    super.onInit();
    _intiMenuItem();
  }

  void _intiMenuItem() {
    menuItems.value.add(MenuItem(title: 'colum 1'));
    menuItems.value.add(MenuItem(title: 'colum 2'));
    menuItems.refresh();
  }
}