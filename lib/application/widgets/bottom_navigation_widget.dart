import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget(
      {super.key,
        this.positionFirstItemSelected,
      required this.numberOfItem,
      required this.bottomNavHeight,
      required this.bottomNavBackgroundColor,
      required this.onItemChange});

  final int numberOfItem;

  final int? positionFirstItemSelected;

  final double bottomNavHeight;

  final Color bottomNavBackgroundColor;

  final Function(int index) onItemChange;

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
      itemBottomNav.isSelectedItem.value = (i == widget.positionFirstItemSelected);
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
              ...List.generate(
                  bottomNav.length,
                  (index) => ItemBottomNavigationComponent(
                        isSelectedItem: bottomNav[index].isSelectedItem.value,
                        onItemChange: () {
                          _onItemChange(bottomNav[index]);

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
    for (var element in bottomNav) {
      element.isSelectedItem.value = false;
    }
  }
}

/// Item component
class ItemBottomNavigationComponent extends StatelessWidget {

  const ItemBottomNavigationComponent({super.key, required this.isSelectedItem, required this.onItemChange});

  final bool isSelectedItem;
  final Function onItemChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemChange();
      },
      child: Container(
        width: 60,
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 3),
        decoration: isSelectedItem ? const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ) : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.home),
            Text('Home', textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }

}

///
class ItemBottomNav {
  Rx<bool> isSelectedItem = Rx(false);
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