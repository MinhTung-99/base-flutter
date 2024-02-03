
import 'package:base_flutter/helpers/base/view_model/base_view_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../widgets/dropdown_widget.dart';
import '../../widgets/poup_menu_widgets/popup_menu_widget.dart';

class FirstViewModel extends BaseViewModel {

  final Rx<List<MenuItem>> menuItems = Rx([]);

  List<DropDownValueModel> dropdownItems = [];

  @override
  void onInit() {
    super.onInit();
    _initMenuItem();
    _initDropDownItem();
  }

  void _initDropDownItem() {
    dropdownItems.add(const DropDownValueModel(name: 'dropdown', value: 'dropdown'));
    dropdownItems.add(const DropDownValueModel(name: 'dropdown1', value: 'dropdown1'));
    dropdownItems.add(const DropDownValueModel(name: 'dropdown2', value: 'dropdown2'));
  }

  void _initMenuItem() {
    menuItems.value.add(MenuItem(title: 'colum 1'));
    menuItems.value.add(MenuItem(title: 'colum 2'));
    menuItems.refresh();
  }
}