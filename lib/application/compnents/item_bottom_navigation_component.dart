
import 'package:flutter/material.dart';

class ItemBottomNavigationComponent extends StatelessWidget {

  const ItemBottomNavigationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [
          Icon(Icons.home),
          Text('Home')
        ],
      ),
    );
  }

}