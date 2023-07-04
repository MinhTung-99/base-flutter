import 'package:base_flutter/application/components/popup_menu_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopupMenuColumTwoActionsWidget extends StatelessWidget {
  const PopupMenuColumTwoActionsWidget({super.key});

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
              child: _columMenuWidget(),
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

  Widget _columMenuWidget() {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 100,
          height: 20,
          color: Colors.yellow,
          child: _itemMenuWidget(
              onTab: () {
                print('Item 1');
              },
              title: 'Item_1'),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.center,
          width: 100,
          height: 20,
          color: Colors.purpleAccent,
          child: _itemMenuWidget(
              onTab: () {
                print('Item 2');
              },
              title: 'Item_2'),
        )
      ],
    );
  }

  Widget _childPopupMenuWidget() {
    return Container(
      color: Colors.blueAccent,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: const Text('POUP MENU COLUM'),
    );
  }
}

class PopupMenuRowThreeActionsWidget extends StatelessWidget {
  const PopupMenuRowThreeActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuComponent(
      menuItem: [
        PopupMenuItem<String>(
          enabled: false,
          child: Container(
            decoration: _getDecorationWithShadow(),
            child: Container(
              height: 50,
              decoration: _getDecoration(),
              child: _rowMenuWidget(),
            ),
          ),
        ),
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

  Widget _rowMenuWidget() {
    return Row(
      children: [
        _itemMenuWidget(
            onTab: () {
              print('0000');
            },
            title: 'Item_0'),
        const SizedBox(
          width: 20,
        ),
        _itemMenuWidget(
            onTab: () {
              print('1111');
            },
            title: 'Item_1'),
        const SizedBox(
          width: 20,
        ),
        _itemMenuWidget(
            onTab: () {
              print('2222');
            },
            title: 'Item_2'),
      ],
    );
  }

  Widget _childPopupMenuWidget() {
    return Container(
      color: Colors.blueAccent,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: const Text('POUP MENU ROW'),
    );
  }
}

Widget _itemMenuWidget({required Function onTab, required String title}) {
  return GestureDetector(
    onTap: () {
      onTab();
      final context = Get.context;
      if (context != null) {
        Navigator.pop(context);
      }
    },
    child: Text(title,
        style: const TextStyle(
          color: Colors.black,
        )),
  );
}
