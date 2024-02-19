import 'package:base_flutter/helpers/base/ui/base_stateful_view.dart';
import 'package:base_flutter/helpers/dialog/dialog_common.dart';
import 'package:base_flutter/injection.dart';
import 'package:base_flutter/pages/syncfusion_flutter_charts/syncfusion_flutter_charts_view.dart';
import 'package:base_flutter/themes/theme_blue.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../themes/theme_red.dart';
import '../../widgets/button_text_widget.dart';
import '../../widgets/date_picker_widgets/date_picker_widget.dart';
import '../../widgets/dropdown_widget.dart';
import '../../widgets/paging_widgets/paging_widget.dart';
import '../../widgets/poup_menu_widgets/popup_menu_widget.dart';
import 'first_view_model.dart';

class FirstView extends StatefulWidget {
  static const route = "/ButtonScreen";

  const FirstView({super.key});

  @override
  State<StatefulWidget> createState() => FirstViewState();
}

class FirstViewState extends BaseStateOfView<FirstView, FirstViewModel> {
  bool _isBlueTheme = true;
  final _methodChannel = const MethodChannel('METHOD_CHANNEL');

  final _eventChannel = const EventChannel('EVENT_CHANNEL');
  final _secondEventChannel = const EventChannel('SECOND_EVENT_CHANNEL');

  void callEventChannel() {
    final subscription =
        _eventChannel.receiveBroadcastStream("EVENT_CHANNEL").listen((message) {
      print('EventChannel===$message');
    });
    //subscription.cancel();
  }

  void callSecondEventChannel() {
    final subscription = _secondEventChannel
        .receiveBroadcastStream("SECOND_EVENT_CHANNEL")
        .listen((message) {
      print('SecondEventChannel===$message');
    });
    //subscription.cancel();
  }

  Widget _spacing10() {
    return const SizedBox(
      height: 10,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonTextWidget(
                title: 'OPEN DIALOG',
                onPressed: () {
                  getIt<DialogCommon>().showAlertDialog(context: context, title: "TEST");
                }),
            _spacing10(),
            const DatePickerWidget(),
            _spacing10(),
            ButtonTextWidget(
                title: 'OPEN BROWSER NATIVE CODE',
                onPressed: () {
                  _methodChannel.invokeMethod('openBrowser');
                }),
            _spacing10(),
            ButtonTextWidget(
                title: 'EVENT CHANNEL',
                onPressed: () {
                  callEventChannel();
                }),
            _spacing10(),
            ButtonTextWidget(
                title: 'SECOND EVENT CHANNEL',
                onPressed: () {
                  callSecondEventChannel();
                }),
            _spacing10(),
            DropDownWidget(
              hintText: 'NOTHING',
              padding: const EdgeInsets.symmetric(horizontal: 10),
              dropDownList: viewModel.dropdownItems,
              singleController: SingleValueDropDownController(
                  data:
                  const DropDownValueModel(name: 'dropdown1', value: 'dropdown1')),
            ),
            PagingWidget(
              currentPage: 1,
              numberOfPages: 20,
              onPageChange: (index) {
                print('sssssss==${index}');
              },
            ),
            _spacing10(),
            Obx(() => PopupMenuColumWidget(menuItems: viewModel.menuItems.value,)),
            _spacing10(),
            ButtonTextWidget(
                title: 'syncfusion flutter charts',
                onPressed: () {
                  Get.toNamed(SyncfusionFlutterChartsView.route);
                }),
            ButtonTextWidget(
                title: 'Change theme',
                onPressed: () {
                  if (_isBlueTheme) {
                    Get.changeTheme(redTheme);
                    _isBlueTheme = false;
                  } else {
                    Get.changeTheme(blueTheme);
                    _isBlueTheme = true;
                  }
                }),
          ],
        ),
      ),
    );
  }

  @override
  FirstViewModel createViewModel() {
    return FirstViewModel();
  }
}
