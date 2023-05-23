import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {

  const DrawerWidget({super.key, required this.drawerItems, required this.onClickItem});

  final List<DrawerItem> drawerItems;

  final Function(int index) onClickItem;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: DrawerItemComponent(drawerItems: drawerItems, onClickItem: onClickItem,),
    );
  }
}

class DrawerItemComponent extends StatelessWidget {
  const DrawerItemComponent({super.key, required this.drawerItems, required this.onClickItem});

  final List<DrawerItem> drawerItems;

  final Function(int index) onClickItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: drawerItems.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              onClickItem(index);
            },
            child: drawerItems[index].itemWidget,
          );
        });
  }
}

///
class DrawerItem {
  const DrawerItem({required this.itemWidget});

  final Widget itemWidget;
}

///
class ItemDrawerWidget extends StatelessWidget {

  const ItemDrawerWidget({super.key, required this.title, required this.backgroundColor});

  final String title;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      alignment: Alignment.centerLeft,
      height: 50,
      child: Text(title),
    );
  }

}