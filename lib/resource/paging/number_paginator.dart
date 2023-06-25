
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'enum_content_display_mode.dart';
import 'inherited_number_paginator.dart';
import 'number_paginator_controller.dart';
import 'number_paginator_ui_config.dart';
import 'paginator_content.dart';

typedef NumberPaginatorContentBuilder = Widget Function(int index);

/// The main widget used for creating a [NumberPaginator].
class NumberPaginator extends StatefulWidget {
  /// Total number of pages that should be shown.
  final int numberPages;

  /// Index of initially selected page.
  final int initialPage;

  /// This function is called when the user switches between pages. The received
  /// parameter indicates the selected index, starting from 0.
  final Function(int)? onPageChange;

  /// The UI config for the [NumberPaginator].
  final NumberPaginatorUIConfig config;

  /// A builder for the central content of the paginator. If provided, the
  /// [config] is ignored.
  final NumberPaginatorContentBuilder? contentBuilder;

  final NumberPaginatorController? controller;

  /// Creates an instance of [NumberPaginator].
  const NumberPaginator({
    Key? key,
    required this.numberPages,
    required this.config,
    this.initialPage = 0,
    this.onPageChange,
    this.contentBuilder,
    this.controller,
  })  : assert(initialPage >= 0),
        assert(initialPage <= numberPages/* - 1*/),
        super(key: key);

  @override
  NumberPaginatorState createState() => NumberPaginatorState();
}

class NumberPaginatorState extends State<NumberPaginator> {
  late NumberPaginatorController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? NumberPaginatorController();
    _controller.currentPage = widget.initialPage;
    _controller.addListener(() {
      widget.onPageChange?.call(_controller.currentPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedNumberPaginator(
      numberPages: widget.numberPages,
      initialPage: widget.initialPage,
      onPageChange: _controller.navigateToPage,
      config: widget.config,
      child: SizedBox(
        height: widget.config.height,
        child: Row(
          children: [
            ..._buildCenterContent(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCenterContent() {
    return [
      if (widget.contentBuilder != null)
        Container(
          child: widget.contentBuilder!(_controller.currentPage),
        )
      else if (widget.config.mode != ContentDisplayMode.hidden)
        Expanded(
          child: PaginatorContent(
            controllerPage: _controller,
            currentPage: _controller.currentPage,
          ),
        ),
    ];
  }
}