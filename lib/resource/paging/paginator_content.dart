
import 'package:flutter/cupertino.dart';
import 'drop_down_content.dart';
import 'enum_content_display_mode.dart';
import 'inherited_number_paginator.dart';
import 'number_paginator_controller.dart';
import 'number_content.dart';

class PaginatorContent extends StatelessWidget {
  final int currentPage;

  final NumberPaginatorController controllerPage;

  const PaginatorContent({
    Key? key,
    required this.currentPage,
    required this.controllerPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mode = InheritedNumberPaginator.of(context).config.mode;

    switch (mode) {
      case ContentDisplayMode.numbers:
        return NumberContent(
          currentPage: currentPage,
          controllerPage: controllerPage,
        );
      case ContentDisplayMode.dropdown:
        return DropDownContent(
          currentPage: currentPage,
        );
      default:
        return Container();
    }
  }
}