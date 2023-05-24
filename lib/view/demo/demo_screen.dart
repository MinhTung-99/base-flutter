import 'dart:async';

import 'package:base_flutter/application/widgets/button_widget.dart';
import 'package:base_flutter/application/widgets/date_picker_widget.dart';
import 'package:base_flutter/application/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../application/base/ui/base_stateful_view.dart';
import '../../application/widgets/bottom_navigation_widget.dart';
import 'demo_view_model.dart';

class DemoScreen extends StatefulViewBase {
  static const router = '/EntryView';

  const DemoScreen({super.key});

  @override
  State<StatefulWidget> createState() => DemoViewState();
}

class DemoViewState extends BaseStateFulView<DemoScreen, DemoViewModel> {
  final _methodChannel = const MethodChannel('METHOD_CHANNEL');

  @override
  Color? get backgroundColor => Colors.white;

  late List<Widget> screenBottomNavigation;
  late Rx<Widget> screen;

  ///DRAWER
  final List<DrawerItem> drawerItems = [];

  @override
  void initState() {
    super.initState();

    /// BOTTOM NAVIGATION
    screenBottomNavigation = [
      _FirstScreen(
        viewModel: viewModel,
        platform: _methodChannel,
      ),
      _SecondScreen(viewModel: viewModel,),
      _ThirdScreen()
    ];
    screen = Rx(screenBottomNavigation[0]);

    /// DRAWABLE
    keyScaffold = GlobalKey();

    drawerItems.add(const DrawerItem(itemWidget: ItemDrawerWidget(title: 'menu 1', backgroundColor: Colors.blue,)));
    drawerItems.add(const DrawerItem(itemWidget: ItemDrawerWidget(title: 'menu 2', backgroundColor: Colors.lightGreen,)));
    ///
  }

  @override
  Widget buildBody(BuildContext context) {
    return Obx(() => BottomNavigationBody(screen: screen.value));
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          keyScaffold?.currentState?.openDrawer();
        },
        child: const Icon(Icons.circle_rounded),
      ),

      /// ICON DRAWABLE
    );
  }

  @override
  Widget? buildDrawer(BuildContext context) {
    return DrawerWidget(
      drawerItems: drawerItems,
      onClickItem: (index) {
        keyScaffold?.currentState?.closeDrawer();
      },
    );
  }

  @override
  Widget? buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationWidget(
      positionFirstItemSelected: 0,
      numberOfItem: screenBottomNavigation.length,
      bottomNavHeight: 70,
      bottomNavBackgroundColor: Colors.blue,
      onItemChange: (index) {
        screen.value = screenBottomNavigation[index];
      },
    );
  }
}

///
class _FirstScreen extends StatelessWidget {

  _FirstScreen({required this.viewModel, required this.platform});

  final _eventChannel = const EventChannel('EVENT_CHANNEL');
  final _secondEventChannel = const EventChannel('SECOND_EVENT_CHANNEL');

  final DemoViewModel viewModel;
  final MethodChannel platform;

  void callEventChannel() {
    final subscription = _eventChannel.receiveBroadcastStream("EVENT_CHANNEL").listen((message) {
      print('EventChannel===$message');
    });
    //subscription.cancel();
  }

  void callSecondEventChannel() {
    final subscription = _secondEventChannel.receiveBroadcastStream("SECOND_EVENT_CHANNEL").listen((message) {
      print('SecondEventChannel===$message');
    });
    //subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _spacing10(),
          ButtonWidget(
              width: 100,
              height: 50,
              radius: 0,
              colorBackground: Colors.blue,
              text: 'OPEN DIALOG',
              onTab: () {
                viewModel.showAlertDialog(context);
              }
          ),
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
                platform.invokeMethod('openBrowser');
              }
          ),
          _spacing10(),
          ButtonWidget(
              width: 200,
              height: 50,
              radius: 0,
              colorBackground: Colors.blue,
              text: 'EVENT CHANNEL',
              onTab: () {
                callEventChannel();
              }
          ),
          _spacing10(),
          ButtonWidget(
              width: 200,
              height: 50,
              radius: 0,
              colorBackground: Colors.blue,
              text: 'SECOND EVENT CHANNEL',
              onTab: () {
                callSecondEventChannel();
              }
          )
        ],
      ),
    );
  }

  Widget _spacing10() {
    return const SizedBox(height: 10,);
  }
}

class _SecondScreen extends StatelessWidget {
  const _SecondScreen({required this.viewModel});

  final DemoViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => Text('count==${viewModel.entryRx.value?.count}')),
        ],
      ),
    );
  }

  Widget _spacing10() {
    return const SizedBox(height: 10,);
  }
}

class _ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('3');
  }
}