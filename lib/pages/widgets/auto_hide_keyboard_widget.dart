
import 'package:flutter/cupertino.dart';

class AutoHideKeyboardComponent extends StatelessWidget {
  const AutoHideKeyboardComponent({
    required this.child,
    Key? key,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    void hideKeyboard() {
      final currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    return GestureDetector(
      onTap: hideKeyboard,
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}