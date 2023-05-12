import 'package:base_flutter/application/compnents/item_bottom_navigation_component.dart';
import 'package:base_flutter/application/widgets/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../application/base/ui/base_stateful_view.dart';
import 'demo_view_model.dart';

class DemoScreen extends StatefulViewBase {
  static const router = '/EntryView';

  const DemoScreen({super.key});

  @override
  State<StatefulWidget> createState() => DemoViewState();
}

class DemoViewState extends BaseStateFulView<DemoScreen, DemoViewModel> {
  static const platform = MethodChannel('NATIVE_CODE');

  @override
  // TODO: implement backgroundColor
  Color? get backgroundColor => Colors.white;

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Obx(() => Text('count==${viewModel.entryRx.value?.count}')),
        GestureDetector(
          onTap: () {
            viewModel.showAlertDialog(context);
          },
          child: const Text('showDialog'),
        ),
        const DatePickerWidget(),
        GestureDetector(
          onTap: () {
            platform.invokeMethod('openBrowser');
          },
          child: const Text('open browser native code'),
        ),
      ],
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar();
  }

  @override
  Widget? buildBottomNavigationBar(BuildContext context) {
    // TODO: implement buildBottomNavigationBar
    return Container(
      height: 60,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          ItemBottomNavigationComponent(),
          ItemBottomNavigationComponent()
        ],
      ),
    );
  }
}
