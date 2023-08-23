import 'package:flutter/material.dart';

import 'enum_content_display_mode.dart';

/// Holds all the relevant information for the configuration of how the
/// [NumberPaginator] should look like.
class NumberPaginatorUIConfig {
  /// The height of the number paginator.
  final double height;

  /// The [PaginatorButton]'s foreground color (text/icon color) when selected.
  ///
  /// Defaults to [Colors.white].
  final Color buttonSelectedForegroundColor;

  /// The [PaginatorButton]'s foreground color (text/icon color) when unselected.
  ///
  /// Defaults to `null`.
  final Color buttonUnselectedForegroundColor;

  final Color buttonNextAndPrevBorderActiveColor;
  final Color buttonNextAndPrevBorderUnActiveColor;
  final Color buttonNextAndPrevBackgroundColor;
  final Color buttonNextAndPrevForegroundColor;
  final Color buttonBorderSelectedColor;
  final Color buttonBorderUnSelectedColor;
  final Color iconUnActiveColor;
  final Color iconActiveColor;

  /// The [PaginatorButton]'s background color when selected.
  ///
  /// Defaults to the [Theme]'s accent color.
  final Color buttonSelectedBackgroundColor;

  /// The [PaginatorButton]'s background color when unselected.
  ///
  /// Defaults to `null`.
  final Color buttonUnselectedBackgroundColor;

  /// The [ContentDisplayMode] for the center content of the number paginator.
  final ContentDisplayMode mode;

  /// The [MainAxisAlignment] of the [Row] that holds the prev/next buttons and
  /// the page number buttons. This property only takes effect [mode] is set to
  /// [ContentDisplayMode.hidden].
  ///
  /// Defaults to [MainAxisAlignment.start].
  final MainAxisAlignment mainAxisAlignment;

  final double? buttonBorderRadius;

  final double withPage;
  final double heightPage;

  final EdgeInsets paddingPage;

  final bool isShowIconNextAndPrev;


  /// Foreground => BorderColor
  const NumberPaginatorUIConfig({
    this.height = 48.0,
    this.heightPage = 36,
    this.withPage = 36,
    this.mode = ContentDisplayMode.numbers,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.isShowIconNextAndPrev = true,
    this.paddingPage = const EdgeInsets.only(left: 6),
    this.buttonBorderRadius = 8,
    required this.buttonSelectedForegroundColor,
    required this.buttonUnselectedForegroundColor,
    required this.buttonSelectedBackgroundColor,
    required this.buttonUnselectedBackgroundColor,
    required this.buttonNextAndPrevBorderActiveColor,
    required this.buttonNextAndPrevBorderUnActiveColor,
    required this.buttonBorderSelectedColor,
    required this.buttonBorderUnSelectedColor,
    required this.iconActiveColor,
    required this.iconUnActiveColor,
    required this.buttonNextAndPrevBackgroundColor,
    required this.buttonNextAndPrevForegroundColor
  });
}
