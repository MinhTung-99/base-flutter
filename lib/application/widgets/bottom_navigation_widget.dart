
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../components/item_bottom_navigation_component.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key, required this.numberOfItem, required this.bottomNavHeight, required this.bottomNavBackgroundColor});

  final int numberOfItem;

  final double bottomNavHeight;

  final Color bottomNavBackgroundColor;

  @override
  State<StatefulWidget> createState() => _BottomNavigation();

}

class _BottomNavigation extends State<BottomNavigationWidget> {

  final List<ItemBottomNav> bottomNav = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bottomNav.clear();
    for (int i = 0; i < widget.numberOfItem; i++) {
      ItemBottomNav itemBottomNav = ItemBottomNav();
      bottomNav.add(itemBottomNav);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: widget.bottomNavHeight,
      color: widget.bottomNavBackgroundColor,
      child: Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(bottomNav.length, (index) => ItemBottomNavigationComponent(
                isSelectedItem: bottomNav[index].isSelectedItem.value,
                onItemChange: _onItemChange,
              ))
        ],
      )),
    );
  }

  void _onItemChange(ItemBottomNav itemBottomNav) {
    _refreshSelectedItemFalse();
    itemBottomNav.isSelectedItem.value = !itemBottomNav.isSelectedItem.value;
  }

  void _refreshSelectedItemFalse() {
    for (var element in bottomNav) {
      element.isSelectedItem.value = false;
    }
  }

}