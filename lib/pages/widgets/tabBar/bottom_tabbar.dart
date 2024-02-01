import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lifecycle/lifecycle.dart';

import '../../app_router.dart';
import '../dot_indicator_widget.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar(
      {super.key, required this.tabs, required this.tabController});

  final List<TabItem> tabs;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Container(
      padding: EdgeInsets.only(bottom: bottomPadding > 0 ? bottomPadding : 30),
      color: Colors.white,
      child: TabBar(
        controller: tabController,
        tabs: tabs.map((item) {
          //int i = tabs.indexOf(item);
          return Tab(
            height: 48,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(children: [
                        Badge(
                            isLabelVisible: false,
                            smallSize: 7.5,
                            largeSize: 7.5,
                            child: SvgPicture.asset(
                              item.icon,
                            )),
                        Text(
                          item.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontSize: 12),
                        ),
                      ])
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),

        indicator: const DotIndicatorWidget(colors: [
          Colors.pinkAccent,
          Colors.pink
        ], borderColor: Colors.white),
      ),
    );
  }
}

class TabItem {
  String title;
  String icon;
  NavigatorWidgetKeepState page;

  TabItem({required this.title, required this.icon, required this.page});
}

/// create handle back button android and keep state navigetion nested
class NavigatorWidgetKeepState extends StatefulWidget {
  /// create handle back button android and keep state navigetion nested
  const NavigatorWidgetKeepState(
      {super.key,
      required this.initRoute,
      required this.nestedId,
      required this.currentIndex});

  /// choose view show when init route or error named route
  final String initRoute;

  /// id nested navigation
  final int nestedId;

  /// tabController.index -> index (index + 1 == nestedId.value) use it to pop nested screen
  /// index = (0 -> 3) nestedId = (1 -> 4)
  final int currentIndex;

  @override
  State<NavigatorWidgetKeepState> createState() =>
      _NavigatorWidgetKeepStateState();
}

class _NavigatorWidgetKeepStateState extends State<NavigatorWidgetKeepState>
    with AutomaticKeepAliveClientMixin {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChildPageLifecycleWrapper(
      index: widget.nestedId,
      wantKeepAlive: true,
      child: Navigator(
        key: Get.nestedKey(widget.nestedId),
        initialRoute: widget.initRoute, // create a key by index
        onGenerateRoute: _router.route,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
