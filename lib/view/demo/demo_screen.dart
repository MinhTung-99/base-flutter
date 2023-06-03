import 'package:base_flutter/application/widgets/drawer_widget.dart';
import 'package:base_flutter/view/demo/button_scrren/button_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../application/base/ui/base_stateful_view.dart';
import '../../application/widgets/bottom_navigation_widget.dart';
import 'demo_view_model.dart';

class DemoScreen extends StatefulWidget {
  static const router = '/EntryView';

  const DemoScreen({super.key});

  @override
  State<StatefulWidget> createState() => DemoViewState();
}

class DemoViewState extends BaseStateFulView<DemoScreen, DemoViewModel> {

  @override
  Color? get backgroundColor => Colors.white;

  ///BOTTOM NAVIGATION
  late List<Widget> screens;
  late Rx<Widget> screen;
  late List<ItemBottomNav> itemBottomNav;

  ///DRAWER
  final List<DrawerItem> drawerItems = [];

  @override
  void initState() {
    super.initState();
    ///SCREEN
    screens = [
      ButtonScreen(viewModel: viewModel,),
      _SecondScreen(viewModel: viewModel,),
      _ThirdScreen()
    ];

    /// BOTTOM NAVIGATION
    itemBottomNav = [
      ItemBottomNav(title: 'BUTTON', icon: const Icon(Icons.ad_units), isSelectedItem: Rx(true)),
      ItemBottomNav(title: 'DATA', icon: const Icon(Icons.account_balance_wallet), isSelectedItem: Rx(false)),
      ItemBottomNav(title: 'OTHER', icon: const Icon(Icons.account_tree), isSelectedItem: Rx(false))
    ];
    screen = Rx(screens[0]);
    ///

    /// DRAWABLE
    keyScaffold = GlobalKey();

    drawerItems.add(const DrawerItem(itemWidget: ItemDrawerWidget(title: 'menu 1', backgroundColor: Colors.blue,)));
    drawerItems.add(const DrawerItem(itemWidget: ItemDrawerWidget(title: 'menu 2', backgroundColor: Colors.lightGreen,)));
    drawerItems.add(const DrawerItem(itemWidget: ItemDrawerWidget(title: 'menu 3', backgroundColor: Colors.limeAccent,)));
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
      headerWidget: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 60, bottom: 10),
        child: const Text('HEADER', style: TextStyle(color: Colors.red, fontSize: 20),),
      ),
      drawerItems: drawerItems,
      onClickItem: (index) {
        screen.value = screens[index];
        keyScaffold?.currentState?.closeDrawer();
      },
    );
  }

  @override
  Widget? buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationWidget(
      withItem: 80,
      bottomNavHeight: 70,
      paddingItemWidget: const EdgeInsets.all(5),
      marginItemWidget: const EdgeInsets.all(7),
      itemBottomNav: itemBottomNav,
      bottomNavBackgroundColor: Colors.blue,
      onItemChange: (index) {
        screen.value = screens[index];
      },
    );
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