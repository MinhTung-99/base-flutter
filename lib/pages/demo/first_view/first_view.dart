import 'package:base_flutter/helpers/base/ui/base_stateful_view.dart';
import 'package:base_flutter/helpers/dialog/dialog_common.dart';
import 'package:base_flutter/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ButtonTextWidget(
              title: 'OPEN DIALOG',
              onPressed: () {
                //getIt<DialogCommon>().showAlertDialog(context: context, title: "TEST");
                getIt<DialogCommon>().a = 100;
                print('ssss==${getIt<DialogCommon>().a}');
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
          // DropDownWidget(
          //   hintText: 'NOTHING',
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   dropDownList: viewModel.items,
          //   singleController: SingleValueDropDownController(
          //       data:
          //       const DropDownValueModel(name: 'ABCCCC', value: 'ABCCBCC')),
          // ),
          PagingWidget(
            currentPage: 1,
            numberOfPages: 6,
            onPageChange: (index) {

            },
          ),
          _spacing10(),
          Obx(() => PopupMenuColumWidget(menuItems: viewModel.menuItems.value,))
        ],
      ),
    );
  }

  @override
  FirstViewModel createViewModel() {
    return FirstViewModel();
  }
}
