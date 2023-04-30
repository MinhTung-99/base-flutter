
import 'package:base_flutter/resource/dialog_common.dart';
import 'package:base_flutter/view/entry/entry_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../application/base/ui/base_stateful_view.dart';

class EntryScreen extends StatefulViewBase {

  static const router = '/EntryView';

  const EntryScreen({super.key});

  @override
  State<StatefulWidget> createState() => EntryViewState();

}

class EntryViewState extends BaseStateFulView<EntryScreen, EntryViewModel> {

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
        )
      ],
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    
    return AppBar(

    );
  }
   
}