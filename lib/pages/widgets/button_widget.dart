
import 'package:base_flutter/pages/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    required this.radius,
    required this.colorBackground,
    required this.text,
    required this.onTab,
    this.padding,
    this.margin,
    this.boxShadows,
    this.colorBorder,
    this.width,
    this.height,
    this.opacity,
    this.widthBorder,
    this.child,
    Key? key,
  }) : super(key: key);

  final String text;

  final double? width;
  final double? height;

  final double radius;

  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  final Color colorBackground;

  final Function() onTab;

  final List<BoxShadow>? boxShadows;

  final double? widthBorder;
  final Color? colorBorder;

  final double? opacity;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTab,
      child: Opacity(
        opacity: opacity ?? 1,
        child: Container(
          width: width,
          height: height,
          padding: padding,
          margin: margin,
          decoration: _getDecoration(),
          child: child ?? _textWidget(context),
        ),
      ),
    );
  }

  Decoration _getDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: colorBackground,
        border: Border.all(color: colorBorder ?? Colors.transparent, width: widthBorder ?? 1.0),
        boxShadow: boxShadows);
  }

  Widget _textWidget(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextWidget(content: text, color: Theme.of(context).colorScheme.background,)
      // Text(
      //   text,
      //   style: textStyle,
      //   textAlign: TextAlign.center,
      // ),
    );
  }
}