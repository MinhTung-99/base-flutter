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
      opacity: isArrow == false
          ? 1
          : (isArrow && selected)
              ? 1
              : 0.3,
      child: Container(
          margin: InheritedNumberPaginator.of(context).config.paddingPage,
          width: InheritedNumberPaginator.of(context).config.withPage,
          height: InheritedNumberPaginator.of(context).config.heightPage,
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      InheritedNumberPaginator.of(context)
                              .config
                              .buttonBorderRadius ??
                          0),
                  side: _borderSideColor(context)),
              backgroundColor:
                  isArrow ? null : _backgroundColor(context, selected),
              foregroundColor:
                  isArrow ? null : _foregroundColor(context, selected),
            ),
            child: child,
          )),
    );
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
                    .buttonNextAndPrevBorderActiveColor
                : InheritedNumberPaginator.of(context)
                    .config
                    .buttonBorderUnSelectedColor));
  }

  Color? _backgroundColor(BuildContext context, bool selected) => selected
      ? (InheritedNumberPaginator.of(context)
          .config
          .buttonSelectedBackgroundColor)
      : InheritedNumberPaginator.of(context)
          .config
          .buttonUnselectedBackgroundColor;

  Color? _foregroundColor(BuildContext context, bool selected) => selected
      ? (InheritedNumberPaginator.of(context)
          .config
          .buttonSelectedForegroundColor)
      : InheritedNumberPaginator.of(context)
          .config
          .buttonUnselectedForegroundColor;
}
