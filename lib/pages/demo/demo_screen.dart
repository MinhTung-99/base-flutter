// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../helpers/base/ui/base_stateful_view.dart';
// import '../widgets/drawer_widget.dart';
// import '../widgets/tabBar/bottom_tabbar.dart';
// import 'button_scrren/first_view.dart';
// import 'demo_view_model.dart';
//
// class DemoScreen extends StatefulWidget {
//   static const router = '/EntryView';
//
//   const DemoScreen({super.key});
//
//   @override
//   State<StatefulWidget> createState() => DemoViewState();
// }
//
// class DemoViewState extends BaseStateOfView<DemoScreen, DemoViewModel> {
//
//   @override
//   Color? get backgroundColor => Colors.white;
//
//   late TabController _tabController;
//   late List<TabItem> tabs = [];
//
//   ///BOTTOM NAVIGATION
//   late List<Widget> screens;
//   late Rx<Widget> screen;
//
//   ///DRAWER
//   final List<DrawerItem> drawerItems = [];
//
//   @override
//   void initState() {
//     super.initState();
//
//
//     tabs = [
//       TabItem(
//           title: 'BUTTON',
//           icon: 'assets/images/tab_menu.svg',
//           page: NavigatorWidgetKeepState(
//             initRoute: ButtonScreen.route,
//             nestedId: 0,
//             currentIndex: viewModel.indexTab.value,
//           )),
//       TabItem(
//           title: 'DATA',
//           icon: 'assets/images/tab_diary.svg',
//           page: NavigatorWidgetKeepState(
//             initRoute: ButtonScreen.route,
//             nestedId: 1,
//             currentIndex: viewModel.indexTab.value,
//           )),
//       TabItem(
//           title: 'OTHER',
//           icon: 'assets/images/tab_record.svg',
//           page: NavigatorWidgetKeepState(
//             initRoute: ButtonScreen.route,
//             nestedId: 2,
//             currentIndex: viewModel.indexTab.value,
//           )),
//     ];
//
//     ///SCREEN
//     screens = [
//       ButtonScreen(viewModel: viewModel,),
//       _SecondScreen(viewModel: viewModel,),
//       _ThirdScreen()
//     ];
//
//     /// BOTTOM NAVIGATION
//     itemBottomNav = [
//       ItemBottomNav(title: 'BUTTON', icon: const Icon(Icons.ad_units), isSelectedItem: Rx(true)),
//       ItemBottomNav(title: 'DATA', icon: const Icon(Icons.account_balance_wallet), isSelectedItem: Rx(false)),
//       ItemBottomNav(title: 'OTHER', icon: const Icon(Icons.account_tree), isSelectedItem: Rx(false))
//     ];
//     screen = Rx(screens[0]);
//     ///
//
//     /// DRAWABLE
//     keyScaffold = GlobalKey();
//
//     drawerItems.add(const DrawerItem(itemWidget: ItemDrawerWidget(title: 'menu 1', backgroundColor: Colors.blue,)));
//     drawerItems.add(const DrawerItem(itemWidget: ItemDrawerWidget(title: 'menu 2', backgroundColor: Colors.lightGreen,)));
//     drawerItems.add(const DrawerItem(itemWidget: ItemDrawerWidget(title: 'menu 3', backgroundColor: Colors.limeAccent,)));
//     ///
//   }
//
//   @override
//   Widget buildBody(BuildContext context) {
//     return Obx(() => BottomNavigationBody(screen: screen.value));
//   }
//
//   @override
//   PreferredSizeWidget? buildAppBar(BuildContext context) {
//     return AppBar(
//       leading: GestureDetector(
//         onTap: () {
//           keyScaffold?.currentState?.openDrawer();
//         },
//         child: const Icon(Icons.circle_rounded),
//       ),
//
//       /// ICON DRAWABLE
//     );
//   }
//
//   @override
//   Widget? buildDrawer(BuildContext context) {
//     return DrawerWidget(
//       headerWidget: Container(
//         alignment: Alignment.center,
//         margin: const EdgeInsets.only(top: 60, bottom: 10),
//         child: const Text('HEADER', style: TextStyle(color: Colors.red, fontSize: 20),),
//       ),
//       drawerItems: drawerItems,
//       onClickItem: (index) {
//         screen.value = screens[index];
//         keyScaffold?.currentState?.closeDrawer();
//       },
//     );
//   }
//
//   @override
//   Widget? buildBottomNavigationBar(BuildContext context) {
//     return BottomNavigationWidget(
//       withItem: 80,
//       bottomNavHeight: 70,
//       paddingItemWidget: const EdgeInsets.all(5),
//       marginItemWidget: const EdgeInsets.all(7),
//       itemBottomNav: itemBottomNav,
//       bottomNavBackgroundColor: Colors.blue,
//       onItemChange: (index) {
//         screen.value = screens[index];
//       },
//     );
//   }
//
//   @override
//   DemoViewModel createViewModel() {
//     return DemoViewModel();
//   }
// }
//
// class _SecondScreen extends StatelessWidget {
//   const _SecondScreen({required this.viewModel});
//
//   final DemoViewModel viewModel;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Obx(() => Text('count==${viewModel.entryRx.value?.count}')),
//         ],
//       ),
//     );
//   }
//
//   Widget _spacing10() {
//     return const SizedBox(height: 10,);
//   }
// }
//
// class _ThirdScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text('3');
//   }
// }