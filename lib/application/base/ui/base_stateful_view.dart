import 'package:base_flutter/application/base/ui/view_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:lifecycle/lifecycle.dart';
import '../view_model/base_view_model.dart';

abstract class BaseStateFulView<Page extends StatefulWidget,
        ViewModel extends BaseViewModel>
    extends State<Page>
    with
        WidgetsBindingObserver,
        ViewInterface,
        LifecycleAware,
        LifecycleMixin {

  @override
  void onLifecycleEvent(LifecycleEvent event) {}

  ViewModel get viewModel => GetInstance().find<ViewModel>();

  @mustCallSuper
  void _initViewState() {
    WidgetsBinding.instance.addObserver(this);
  }

  @mustCallSuper
  void didChangeViewDependencies() {
  }

  @override
  @mustCallSuper
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

  @override
  @nonVirtual
  void initState() {
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
  @mustCallSuper
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
