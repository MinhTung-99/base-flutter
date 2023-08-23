import 'package:flutter/material.dart';

import 'inherited_number_paginator.dart';

class PaginatorButton extends StatelessWidget {
  /// Callback for button press.
  final VoidCallback? onPressed;

  /// The child of the button.
  final Widget child;

  /// Whether the button is currently selected.
  final bool selected;

  final bool isArrow;

  /// Creates an instance of [PaginatorButton].
  const PaginatorButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.selected = false,
      this.isArrow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _getOpacity(),
      child: Container(
          margin: InheritedNumberPaginator.of(context).config.paddingPage,
          width: InheritedNumberPaginator.of(context).config.withPage,
          height: InheritedNumberPaginator.of(context).config.heightPage,
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              shape: _getShape(context),
              backgroundColor: _backgroundColor(context, selected),
              foregroundColor: _foregroundColor(context, selected),
            ),
            child: child,
          )),
    );
  }

  OutlinedBorder _getShape(BuildContext context) {
    return RoundedRectangleBorder(
        borderRadius: _getBorderRadius(context),
        side: _borderSideColor(context));
  }

  BorderRadiusGeometry _getBorderRadius(BuildContext context) {
    return BorderRadius.circular(
        InheritedNumberPaginator.of(context).config.buttonBorderRadius ?? 0);
  }

  double _getOpacity() {
    return isArrow == false
        ? 1
        : (isArrow && selected)
            ? 1
            : 0.3;
  }

  BorderSide _borderSideColor(BuildContext context) {
    return BorderSide(
        color: selected
            ? (isArrow
                ? InheritedNumberPaginator.of(context)
                    .config
                    .buttonNextAndPrevBorderActiveColor
                : InheritedNumberPaginator.of(context)
                    .config
                    .buttonBorderSelectedColor)
            : (isArrow
                ? InheritedNumberPaginator.of(context)
                    .config
                    .buttonNextAndPrevBorderUnActiveColor
                : InheritedNumberPaginator.of(context)
                    .config
                    .buttonBorderUnSelectedColor));
  }

  Color? _backgroundColor(BuildContext context, bool selected) => isArrow
      ? InheritedNumberPaginator.of(context)
          .config
          .buttonNextAndPrevBackgroundColor
      : selected
          ? (InheritedNumberPaginator.of(context)
              .config
              .buttonSelectedBackgroundColor)
          : InheritedNumberPaginator.of(context)
              .config
              .buttonUnselectedBackgroundColor;

  Color? _foregroundColor(BuildContext context, bool selected) => isArrow
      ? InheritedNumberPaginator.of(context)
          .config
          .buttonNextAndPrevForegroundColor
      : selected
          ? (InheritedNumberPaginator.of(context)
              .config
              .buttonSelectedForegroundColor)
          : InheritedNumberPaginator.of(context)
              .config
              .buttonUnselectedForegroundColor;
}
