
import 'package:base_flutter/resource/paging/number_paginator_ui_config.dart';
import 'package:flutter/material.dart';

import '../../resource/paging/number_paginator.dart';
import '../../resource/paging/number_paginator_controller.dart';
import '../responsives/responsive.dart';

class PagingWidget extends StatefulWidget {

  const PagingWidget({super.key, required this.currentPage, required this.numberOfPages, this.numberPaginatorUIConfig, required this.onPageChange});

  final int currentPage;
  final int numberOfPages;
  final Function(int) onPageChange;
  final NumberPaginatorUIConfig? numberPaginatorUIConfig;

  @override
  State<StatefulWidget> createState() => PagingViewState();

}

class PagingViewState extends State<PagingWidget> {

  late int _currentPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _currentPage = widget.currentPage;
  }

  @override
  Widget build(BuildContext context) {
    return NumberPaginator(
      controller: NumberPaginatorController(),
      initialPage: _currentPage,
      numberPages: widget.numberOfPages,
      config: _getConfig(),
      onPageChange: (index) {
        widget.onPageChange(index);
        setState(() {
          _currentPage = index;
        });
      },
    );
  }

  NumberPaginatorUIConfig _getConfig() {
    return widget.numberPaginatorUIConfig ?? NumberPaginatorUIConfig(
      buttonSelectedForegroundColor: Colors.limeAccent,
      buttonUnselectedForegroundColor: const Color(0xFF3333333),
      buttonUnselectedBackgroundColor: Colors.limeAccent,
      buttonSelectedBackgroundColor: const Color(0xFF037AF9),
      buttonNextAndPrevBorderActiveColor: Colors.deepOrangeAccent,
      buttonNextAndPrevBorderUnActiveColor: const Color(0xFFA2A7B5).withOpacity(0.4),
      buttonBorderSelectedColor: const Color(0xFF037AF9),
      buttonBorderUnSelectedColor: const Color(0xFFA2A7B5).withOpacity(0.4),
      iconUnActiveColor: Colors.red,
      iconActiveColor: Colors.deepPurpleAccent,
    );
  }
}