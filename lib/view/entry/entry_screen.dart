
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
    return Container(
      alignment: Alignment.center,
      child: Obx(() => Text('count==${viewModel.entryRx.value?.count}')),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    
    return AppBar(

    );
  }
   
}