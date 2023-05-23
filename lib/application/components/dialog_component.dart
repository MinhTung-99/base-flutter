import 'package:base_flutter/application/themes/app_text_styles.dart';
import 'package:base_flutter/application/components/icon_close_component.dart';
import 'package:flutter/material.dart';

import '../responsives/responsive.dart';
import '../responsives/size_config.dart';
import '../widgets/auto_hide_keyboard_widget.dart';

class DialogComponent extends StatelessWidget {
  DialogComponent(
      {super.key,
        required this.marginToCloseButton,
        required this.child,
        this.marginToBottomMobile = 20,
        this.marginToBottomTablet = 40,
        this.widthTablet,
        this.marginHorizontalFromListViewTablet = 40.0,
        this.marginRightToCloseButton,
        this.title,
        this.marginTopFromTitle = 0,
        this.margin,
      });

  final double marginToCloseButton;
  final double? marginRightToCloseButton;
  final double? widthTablet;
  final double marginToBottomMobile;
  final double marginToBottomTablet;
  final double marginHorizontalFromListViewTablet;
  final Widget child;
  final _scrollController = ScrollController();
  final String? title;

  final double marginTopFromTitle;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            padding: _getPaddingDialog(),
            margin: margin,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _minHeightTop(20),

                _contentDialogWidget(context: context, constraints: constraints),

                _minHeightBottom(context: context, plusBottom: 20),
              ],
            ),
          );
        },
      ),
    );
  }

  EdgeInsetsGeometry _getPaddingDialog() {
    return const EdgeInsets.only(left: 16, right: 16);
  }

  Widget _contentDialogWidget({required BuildContext context, required BoxConstraints constraints }) {
    return AutoHideKeyboardWidget(
      child: Container(
        constraints: _getBoxConstraint(constraints: constraints, context: context),
        width: _getWith(context),
        decoration: _getBoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _titleAndCloseWidget(context),
            _childWidget(context),
          ],
        ),
      ),
    );
  }

  Widget _titleAndCloseWidget(BuildContext context) {
    return Container(
      margin: _getMarginTitleAndClose(context),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _titleWidget(),
          _closeWidget(context)
        ],
      ),
    );
  }

  Widget _childWidget(BuildContext context) {
    return Flexible(
      child: Scrollbar(
        trackVisibility: true,
        thumbVisibility: true,
        interactive: true,
        controller: _scrollController,
        child: ListView(
          padding: _getPaddingChild(context),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          controller: _scrollController,
          children: [child],
        ),
      ),
    );
  }

  EdgeInsetsGeometry _getMarginTitleAndClose(BuildContext context) {
    return Responsive.isMobile(context)
        ? const EdgeInsets.fromLTRB(20, 20, 0, 0)
        : const EdgeInsets.fromLTRB(0, 12, 0, 0);
  }

  EdgeInsetsGeometry _getMarginIconClose(BuildContext context) {
    return Responsive.isMobile(context)
        ? EdgeInsets.fromLTRB(
        0, 0, marginRightToCloseButton ?? 20, 0)
        : EdgeInsets.fromLTRB(0, 0,
        marginRightToCloseButton ?? 12, 0);
  }
  
  EdgeInsetsGeometry _getPaddingChild(BuildContext context) {
    return Responsive.isMobile(context)
        ? EdgeInsets.fromLTRB(20, marginToCloseButton,
        20, marginToBottomMobile)
        : EdgeInsets.fromLTRB(
        marginHorizontalFromListViewTablet,
        marginToCloseButton,
        marginHorizontalFromListViewTablet,
        marginToBottomTablet);
  }

  Widget _titleWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title ?? '',
          style: notoSansJPMedium_colorBack3333_fontSize16,
        )
      ],
    );
  }

  Widget _closeWidget(BuildContext context) {
    return Container(
      margin: _getMarginIconClose(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          IconCloseComponent(),
        ],
      ),
    );
  }

  BoxDecoration _getBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
    );
  }

  BoxConstraints _getBoxConstraint ({required BoxConstraints constraints, required BuildContext context}) {
    return BoxConstraints(
        maxHeight: constraints.maxHeight -
            40 -
            MediaQuery.of(context).viewInsets.bottom);
  }

  double _getWith(BuildContext context) {
    return Responsive.isTablet(context)
        ? SizeConfig.getWidth(
        context: context, widthTablet: widthTablet ?? 600)
        : double.infinity;
  }

  Widget _minHeightTop(double minHeight) {
    return Container(
      constraints: BoxConstraints(minHeight: minHeight),
    );
  }

  Widget _minHeightBottom({required BuildContext context, required double plusBottom}) {
    return Container(
        constraints: BoxConstraints(
            minHeight:
            plusBottom + MediaQuery.of(context).viewInsets.bottom));
  }
}

