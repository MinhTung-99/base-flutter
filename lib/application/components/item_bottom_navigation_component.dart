
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class ItemBottomNav {
  Rx<bool> isSelectedItem = Rx(false);
}