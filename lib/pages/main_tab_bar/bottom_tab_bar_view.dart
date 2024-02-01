import 'package:base_flutter/helpers/base/ui/base_stateful_view.dart';
import 'package:base_flutter/pages/main_tab_bar/bottom_tab_bar_view_model.dart';
import 'package:base_flutter/pages/widgets/tabBar/bottom_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:lifecycle/lifecycle.dart';

import '../demo/button_scrren/first_view.dart';

class BottomTabBarView extends StatefulWidget {
  static const route = "/MainTabBarView";

  const BottomTabBarView({super.key});

  @override
  State<StatefulWidget> createState() => BottomTabBarViewState();
}

class BottomTabBarViewState
    extends BaseStateOfView<BottomTabBarView, BottomTabBarViewModel>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<TabItem> tabs = [];

  @override
  void initState() {
    super.initState();

    tabs = [
      TabItem(
          title: 'BUTTON',
          icon: 'assets/images/tab_menu.svg',
          page: NavigatorWidgetKeepState(
            initRoute: FirstView.route,
            nestedId: 0,
            currentIndex: viewModel.indexTab.value,
          )),
      TabItem(
          title: 'DATA',
          icon: 'assets/images/tab_diary.svg',
          page: NavigatorWidgetKeepState(
            initRoute: FirstView.route,
            nestedId: 1,
            currentIndex: viewModel.indexTab.value,
          )),
      TabItem(
          title: 'OTHER',
          icon: 'assets/images/tab_record.svg',
          page: NavigatorWidgetKeepState(
            initRoute: FirstView.route,
            nestedId: 2,
            currentIndex: viewModel.indexTab.value,
          )),
    ];

    _tabController = TabController(
        vsync: this,
        length: tabs.length,
        initialIndex: viewModel.indexTab.value);
  }

  @override
  Widget? buildBottomNavigationBar(BuildContext context) {
    return BottomTabBar(
      tabs: tabs,
      tabController: _tabController,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return PageViewLifecycleWrapper(
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: tabs.map((e) => e.page).toList(),
      ),
    );
  }

  @override
  BottomTabBarViewModel createViewModel() {
    return BottomTabBarViewModel();
  }
}
