
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'inherited_number_paginator.dart';
import 'paginator_button.dart';

/// A paginator button that has an [Icon] as a child, instead of text. The icon
/// scales with the available space, depending on the size of the button.
class PaginatorIconButton extends StatelessWidget {
  final IconData icon;
  final String pathImage;
  final VoidCallback? onPressed;

  const PaginatorIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    required this.pathImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaginatorButton(
      onPressed: onPressed,
      isArrow: true,
      selected: onPressed != null,
      child: SvgPicture.asset(pathImage, color: onPressed == null ? InheritedNumberPaginator.of(context).config.iconUnActiveColor : InheritedNumberPaginator.of(context).config.iconActiveColor,),
    );
  }
}