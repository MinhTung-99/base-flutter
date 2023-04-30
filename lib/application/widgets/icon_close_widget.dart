
import 'package:flutter/cupertino.dart';

class IconCloseWidget extends StatelessWidget {

  const IconCloseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        width: 42,
        height: 42,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/ic_btn_close.png',
          width: 40,
          height: 40,
          fit: BoxFit.fill,
        ),
      ),
      onTap: () => Navigator.pop(context, true),
    );
  }
}