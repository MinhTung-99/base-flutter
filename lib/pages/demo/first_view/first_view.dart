import 'package:base_flutter/helpers/base/ui/base_stateful_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../widgets/button_widget.dart';
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
        //  _spacing10(),
          // ButtonWidget(
          //     width: 100,
          //     height: 50,
          //     radius: 0,
          //     colorBackground: Colors.blue,
          //     text: 'OPEN DIALOG',
          //     onTab: () {
          //       viewModel.showAlertDialog(context);
          //     }),
          _spacing10(),
          const DatePickerWidget(),
          _spacing10(),
          ButtonWidget(
              width: 200,
              height: 50,
              radius: 0,
              colorBackground: Colors.blue,
              text: 'OPEN BROWSER NATIVE CODE',
              onTab: () {
                _methodChannel.invokeMethod('openBrowser');
              }),
          _spacing10(),
          ButtonWidget(
              width: 200,
              height: 50,
              radius: 0,
              colorBackground: Colors.blue,
              text: 'EVENT CHANNEL',
              onTab: () {
                callEventChannel();
              }),
          _spacing10(),
          ButtonWidget(
              width: 200,
              height: 50,
              radius: 0,
              colorBackground: Colors.blue,
              text: 'SECOND EVENT CHANNEL',
              onTab: () {
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
