
import 'package:base_flutter/config/enums.dart';
import 'package:flutter/cupertino.dart';

class TextWidget extends StatelessWidget{

  const TextWidget(
      {super.key,
        this.color,
        this.fontSize,
        required this.content,
        this.fonts,
        this.textAlign});

  final String content;
  final double? fontSize;
  final Color? color;
  final TextAlign? textAlign;
  final FONTS? fonts;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign ?? TextAlign.start,
      content,
      style:
      TextStyle(fontSize: fontSize, color: color, fontFamily: fonts?.value),
    );
  }

}