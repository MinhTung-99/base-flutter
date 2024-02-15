import 'package:flutter/material.dart';

class PopupMenuComponent extends StatelessWidget {
  const PopupMenuComponent(
      {super.key,
      required this.menuItem,
      required this.child,
      this.elevation,
      this.offset});

  final List<PopupMenuEntry<String>> menuItem;
  final Widget child;

  final double? elevation;
  final Offset? offset;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: Listener(
          onPointerDown: (_) async {
            if (FocusScope.of(context).hasFocus) {
              FocusScope.of(context).unfocus();
              await Future.delayed(const Duration(milliseconds: 500));
            }
          },
          child: PopupMenuButton<String>(
            color: Colors.transparent,
            padding: EdgeInsets.zero,
            elevation: elevation ?? 0,
            offset: offset ?? const Offset(0, 40),
            itemBuilder: (BuildContext context) => menuItem,
            child: child,
          ),
        ));
  }
}
