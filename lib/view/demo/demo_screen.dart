
import 'package:base_flutter/application/widgets/date_picker_widget.dart';
import 'package:flutter/material.dart';
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
          child: Text('showDialog'),
        ),

        const DatePickerWidget()
      ],
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    
    return AppBar(

    );
  }
   
}