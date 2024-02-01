import 'package:base_flutter/helpers/base/ui/view_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:lifecycle/lifecycle.dart';
import '../view_model/base_view_model.dart';

abstract class BaseStateOfView<Page extends StatefulWidget,
        ViewModel extends BaseViewModel>
    extends State<Page>
    with
        WidgetsBindingObserver,
        ViewInterface,
        LifecycleAware,
        LifecycleMixin {

  @override
  void onLifecycleEvent(LifecycleEvent event) {}

  @mustCallSuper
  void _initViewState() {
    WidgetsBinding.instance.addObserver(this);
  }

  @mustCallSuper
  void didChangeViewDependencies() {
  }

  @override
  void didChangeDependencies() {
    didChangeViewDependencies();
    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (mounted) {
      switch (state) {
        case AppLifecycleState.inactive:
          print('AppLifecycleState.inactive');
          onInActive();
          break;
        case AppLifecycleState.paused:
          print('AppLifecycleState.paused');
          onPaused();
          break;
        case AppLifecycleState.resumed:
          print('AppLifecycleState.resumed');
          onResumed();
          break;
        case AppLifecycleState.detached:
          print('AppLifecycleState.detached');
          onDetached();
          break;
      }
    }
  }

  void onInActive() {}

  void onPaused() {}

  void onResumed() {}

  void onDetached() {}

  late ViewModel viewModel;

  @override
  void initState() {
    viewModel = createViewModel();
    viewModel.onInit();
    WidgetsBinding.instance.addObserver(this);
    _initViewState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: willPopCallBack, child: buildPage(context));
  }

  Future<bool> willPopCallBack() async {
    return true;
  }

  @override
  void dispose() {
    viewModel.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @mustCallSuper
  ViewModel createViewModel();
}
