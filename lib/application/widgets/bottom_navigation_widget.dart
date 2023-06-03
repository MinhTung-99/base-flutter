import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget(
      {super.key,
      required this.itemBottomNav,
      required this.bottomNavHeight,
      required this.bottomNavBackgroundColor,
      required this.onItemChange,
      required this.withItem,
      this.paddingItemWidget,
      this.marginItemWidget});

  final List<ItemBottomNav> itemBottomNav;

  final double bottomNavHeight;

  final Color bottomNavBackgroundColor;

  final Function(int index) onItemChange;

  final double withItem;

  final EdgeInsetsGeometry? paddingItemWidget;
  final EdgeInsetsGeometry? marginItemWidget;

  @override
  State<StatefulWidget> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.bottomNavHeight,
      width: widget.bottomNavHeight,
      color: widget.bottomNavBackgroundColor,
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                  widget.itemBottomNav.length,
                  (index) => ItemBottomNavigationComponent(
                        paddingItemWidget: widget.paddingItemWidget,
                        marginItemWidget: widget.marginItemWidget,
                        withItem: widget.withItem,
                        icon: widget.itemBottomNav[index].icon,
                        title: widget.itemBottomNav[index].title,
                        isSelectedItem:
                            widget.itemBottomNav[index].isSelectedItem.value,
                        onItemChange: () {
                          _onItemChange(widget.itemBottomNav[index]);

                          widget.onItemChange(index);
                        },
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
    for (var element in widget.itemBottomNav) {
      element.isSelectedItem.value = false;
    }
  }
}

/// Item component
class ItemBottomNavigationComponent extends StatelessWidget {
  const ItemBottomNavigationComponent(
      {super.key,
      required this.paddingItemWidget,
      required this.marginItemWidget,
      required this.isSelectedItem,
      required this.onItemChange,
      required this.icon,
      required this.title,
      required this.withItem});

  final bool isSelectedItem;
  final Function onItemChange;
  final Widget icon;
  final String title;
  final double withItem;

  final EdgeInsetsGeometry? paddingItemWidget;
  final EdgeInsetsGeometry? marginItemWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemChange();
      },
      child: Container(
        width: withItem,
        height: double.infinity,
        padding: paddingItemWidget,
        margin: marginItemWidget,
        decoration: isSelectedItem
            ? const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Expanded(child: Text(
              title,
              textAlign: TextAlign.center,
            ))
          ],
        ),
      ),
    );
  }
}

///
class ItemBottomNav {
  ItemBottomNav({required this.title, required this.icon, required this.isSelectedItem});

  Rx<bool> isSelectedItem;
  final String title;
  final Widget icon;
}

///
class BottomNavigationBody extends StatelessWidget {
  const BottomNavigationBody({super.key, required this.screen});

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return screen;
  }
}
