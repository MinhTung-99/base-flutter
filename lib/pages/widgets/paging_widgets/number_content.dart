import 'dart:math';
import 'package:base_flutter/pages/widgets/paging_widgets/paginator_button.dart';
import 'package:base_flutter/pages/widgets/paging_widgets/paginator_icon_button.dart';
import 'package:flutter/material.dart';

import 'auto_size_text.dart';
import 'inherited_number_paginator.dart';
import 'number_paginator_controller.dart';

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
        // if (Responsive.isTablet(context)) {
        //   availableSpots -= 10;
        // }

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
                )),
            ..._generateButtonList(context, availableSpots),
            Visibility(
              visible:
                  InheritedNumberPaginator.of(context).config.isShowIconNextAndPrev,
              child: PaginatorIconButton(
                pathImage: 'assets/images/ic_arrow_page_right.svg',
                onPressed: controllerPage.currentPage <
                        InheritedNumberPaginator.of(context).numberPages - 1
                    ? controllerPage.next
                    : null,
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
    List<int> pages = [];
    final totalPage = InheritedNumberPaginator.of(context).numberPages;
    final myPage = currentPage;
    if (totalPage <= 7) {
      pages = List<int>.generate(totalPage, (index) => index + 1);
    } else if (myPage <= 2) {
      pages = [1, 2, 3, 4, -1, totalPage - 2, totalPage - 1, totalPage];
    } else if (myPage <= 4) {
      pages = [1, -1];
      pages.addAll(List<int>.generate(5, (index) => index + 3));
      if (totalPage > 8) {
        pages.add(-1);
      }
      pages.addAll([totalPage]);
    } else if (myPage < totalPage - 3) {
      pages = [1, -1];
      pages.addAll(List<int>.generate(5, (index) => myPage + index - 2));
      pages.addAll([-1, totalPage]);
    } else if (myPage < totalPage - 2) {
      pages = [1, -1];
      pages.addAll(
          List<int>.generate(5, (index) => totalPage - index - 2).reversed);
      pages.addAll([-1, totalPage]);
    } else {
      pages = [1, 2, 3, 4, -1];
      pages.addAll(List<int>.generate(3, (index) => totalPage - 2 + index));
    }

    // return List.generate((maxValue - minValue < 0 ? 0 : (maxValue - minValue)),
    //     (index) => _buildPageButton(context, minValue + index));

    return List.generate(
        pages.length, (index) => _buildPageButton(context, pages[index]));
  }

  /// Builds a button for the given index.
  Widget _buildPageButton(BuildContext context, int index) {
    if (index == -1) {
      return _buildDots(context);
    }
    return PaginatorButton(
      onPressed: () =>
          InheritedNumberPaginator
              .of(context)
              .onPageChange
              ?.call(index),
      selected: _selected(index),
      child: AutoSizeText((index).toString(), maxLines: 1, minFontSize: 5),
    );
  }

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
