import 'dart:math';
import 'package:base_flutter/resource/paging/paginator_icon_button.dart';
import 'package:flutter/material.dart';
import '../../application/responsives/responsive.dart';
import 'auto_size_text.dart';
import 'inherited_number_paginator.dart';
import 'number_paginator_controller.dart';
import 'paginator_button.dart';

class NumberContent extends StatelessWidget {
  final int currentPage;

  final EdgeInsets? paddingPage;

  final NumberPaginatorController controllerPage;

  const NumberContent({
    Key? key,
    required this.currentPage,
    this.paddingPage,
    required this.controllerPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        /// Buttons have an aspect ratio of 1:1. Therefore use paginator height as
        /// button width.
        var buttonWidth = constraints.maxHeight;
        var availableSpots = (constraints.maxWidth / buttonWidth).floor();
        if (Responsive.isTablet(context)) {
          availableSpots -= 10;
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
                visible:
                    InheritedNumberPaginator.of(context).config.isShowIconNextAndPrev,
                child: PaginatorIconButton(
                  pathImage: 'assets/images/ic_arrow_page_left.svg',
                  onPressed: controllerPage.currentPage > 0
                      ? controllerPage.prev
                      : null,
                  icon: Icons.chevron_left,
                )),
            _buildPageButton(context, 0),
            if (_frontDotsShouldShow(context, availableSpots))
              _buildDots(context),
            if (InheritedNumberPaginator.of(context).numberPages > 1)
              ..._generateButtonList(context, availableSpots),
            if (_backDotsShouldShow(context, availableSpots))
              _buildDots(context),
            if (InheritedNumberPaginator.of(context).numberPages > 1)
              _buildPageButton(context,
                  InheritedNumberPaginator.of(context).numberPages - 1),
            Visibility(
              visible:
                  InheritedNumberPaginator.of(context).config.isShowIconNextAndPrev,
              child: PaginatorIconButton(
                pathImage: 'assets/images/ic_arrow_page_right.svg',
                onPressed: controllerPage.currentPage <
                        InheritedNumberPaginator.of(context).numberPages - 1
                    ? controllerPage.next
                    : null,
                icon: Icons.chevron_right,
              ),
            ),
          ],
        );
      },
    );
  }

  /// Generates the variable button list which is at the center of the (optional)
  /// dots. The very last and first pages are shown independently of this list.
  List<Widget> _generateButtonList(BuildContext context, int availableSpots) {
    // if dots shown: available minus (2 for first and last pages + 2 for dots)
    var shownPages = availableSpots -
        2 -
        (_backDotsShouldShow(context, availableSpots) ? 1 : 0) -
        (_frontDotsShouldShow(context, availableSpots) ? 1 : 0);

    var numberPages = InheritedNumberPaginator.of(context).numberPages;

    int minValue, maxValue;
    minValue = max(1, currentPage - shownPages ~/ 2);
    maxValue = min(minValue + shownPages, numberPages - 1);
    if (maxValue - minValue < shownPages) {
      minValue = (maxValue - shownPages).clamp(1, numberPages - 1);
    }

    return List.generate((maxValue - minValue < 0 ? 0 : (maxValue - minValue)),
        (index) => _buildPageButton(context, minValue + index));
  }

  /// Builds a button for the given index.
  Widget _buildPageButton(BuildContext context, int index) => PaginatorButton(
        onPressed: () =>
            InheritedNumberPaginator.of(context).onPageChange?.call(index),
        selected: _selected(index),
        child:
            AutoSizeText((index + 1).toString(), maxLines: 1, minFontSize: 5),
      );

  Widget _buildDots(BuildContext context) => Container(
        // padding: const EdgeInsets.all(4.0),
        //margin: const EdgeInsets.all(8.0),
        alignment: Alignment.bottomCenter,
        /* decoration: ShapeDecoration(
        shape: InheritedNumberPaginator.of(context).config.buttonShape ??
            const CircleBorder(),
        color: InheritedNumberPaginator.of(context)
            .config
            .buttonUnselectedBackgroundColor,
      ),*/
        child: Container(
          width: 28,
          margin: const EdgeInsets.only(left: 7),
          alignment: Alignment.center,
          child: AutoSizeText(
            "...",
            style: TextStyle(
              color: InheritedNumberPaginator.of(context)
                      .config
                      .buttonUnselectedForegroundColor ??
                  Theme.of(context).colorScheme.secondary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  /// Checks if pages don't fit in available spots and dots have to be shown.
  bool _backDotsShouldShow(BuildContext context, int availableSpots) =>
      availableSpots < InheritedNumberPaginator.of(context).numberPages &&
      currentPage <
          InheritedNumberPaginator.of(context).numberPages -
              availableSpots ~/ 2;

  bool _frontDotsShouldShow(BuildContext context, int availableSpots) =>
      availableSpots < InheritedNumberPaginator.of(context).numberPages &&
      (currentPage + 9) > availableSpots ~/ 2 + 8;

  /// Checks if the given index is currently selected.
  bool _selected(index) => index == currentPage;
}
