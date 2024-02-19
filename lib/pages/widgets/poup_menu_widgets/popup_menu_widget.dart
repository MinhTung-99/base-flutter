import 'package:base_flutter/pages/widgets/button_text_widget.dart';
import 'package:base_flutter/pages/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'popup_menu_component.dart';

class MenuItem {
  String title;

  MenuItem({required this.title});
}

class PopupMenuColumWidget extends StatelessWidget {
  const PopupMenuColumWidget({super.key, required this.menuItems});

  final List<MenuItem> menuItems;

  @override
  Widget build(BuildContext context) {
    return PopupMenuComponent(
      menuItem: [
        PopupMenuItem<String>(
          enabled: false,
          child: Container(
            decoration: _getDecorationWithShadow(),
            child: Container(
              decoration: _getDecoration(),
              child: Column(
                children: menuItems.map((item) {
                  return _itemMenuWidget(
                      context: context,
                      onTab: () {
                        print(item.title);
                      },
                      title: item.title);
                }).toList(),
              ),
            ),
          ),
        )
      ],
      child: _childPopupMenuWidget(),
    );
  }

  Decoration? _getDecorationWithShadow() {
    return BoxDecoration(borderRadius: BorderRadius.circular(8), boxShadow: [
      BoxShadow(
          offset: const Offset(0, 0),
          color: const Color(0xff000000).withOpacity(0.2),
          blurStyle: BlurStyle.normal,
          blurRadius: 8)
    ]);
  }

  Decoration? _getDecoration() {
    return BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(8));
  }

  Widget _childPopupMenuWidget() {
   // return Text('ACBCC');
    return const ButtonTextWidget(title: "POUP MENU COLUM");
  }
}

Widget _itemMenuWidget(
    {required Function onTab,
    required String title,
    required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      onTab();
      Navigator.of(context).pop();
    },
    child: Container(
      alignment: Alignment.center,
      width: 200,
      height: 50,
      decoration: const BoxDecoration(
          color: Colors.yellow,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black))),
      child: TextWidget(text: title,),
    ),
  );
}
