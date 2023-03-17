import 'package:base/presemtations/base/ui/view/view_interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/get_instance.dart';
import 'package:logger/logger.dart';

import '../view_model_base.dart';

/// StateLessViewBase
abstract class StateLessViewBase<T extends ViewModelBase> extends GetView<T>
    with ViewInterface {
  /// logger
  final logger = Logger();

  StateLessViewBase({super.key});

  /// viewModel
  T get viewModel => GetInstance().find<T>(tag: tag);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
          onWillPop: willPopCallBack,
          child: buildPage(context),
    );
  }

  /// willPopCallBack
  Future<bool> willPopCallBack() async {
    return true;
  }
}

abstract class GetView<T> extends StatelessWidget {
  const GetView({Key? key}) : super(key: key);

  final String? tag = null;

  T get controller => GetInstance().find<T>(tag: tag)!;

  @override
  Widget build(BuildContext context);
}
