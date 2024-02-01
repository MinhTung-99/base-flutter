import 'package:flutter/material.dart';

class DotIndicatorWidget extends Decoration {

  final List<Color> colors;
  final Color borderColor;

  const DotIndicatorWidget({
    this.colors = const [Colors.blue,Colors.blue],
    this.borderColor = Colors.white
  });
  @override
  CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return CustomPainter(
        this,
        onChanged,
        colors,
        borderColor
    );
  }
}

class CustomPainter extends BoxPainter {
  final DotIndicatorWidget decoration;
  final List<Color> colors;
  final Color borderColor;

  CustomPainter(
      this.decoration,
      VoidCallback? onChanged,
      this.colors,
      this.borderColor,
      )   : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    //offset is the position from where the decoration should be drawn.
    //configuration.size tells us about the height and width of the tab.

    double xAxisPos = offset.dx + configuration.size!.width / 2;
    double yAxisPos =
        offset.dy + configuration.size!.height / 2 ;
    Offset newOffet = Offset(xAxisPos, yAxisPos);
    final Paint paint = Paint();
    paint.color = borderColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    canvas.drawCircle(newOffet, 34, paint);

    final Paint fillPaint = Paint();
    fillPaint.shader = LinearGradient(
      begin : Alignment.topCenter,
      end : Alignment.bottomCenter,
      colors: colors,
    ).createShader(Rect.fromCircle(
      center: newOffet,
      radius: 34,
    ));
    fillPaint.style = PaintingStyle.fill;
    canvas.drawCircle(newOffet, 34, fillPaint);
  }
}