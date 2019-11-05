import 'package:flutter/material.dart';
import 'dart:math';

/*
 * CustomPainter
 */
class TabIndicationPainter extends CustomPainter {
  Paint painter;
  double dxTarget;
  double dxEntry;
  double radius;
  double dy;

  PageController pageController;

  TabIndicationPainter(
      {this.dxTarget = 125.0,
      this.dxEntry = 25.0,
      this.radius = 21.0,
      this.dy = 25.0,
      this.pageController})
      : super(repaint: pageController) {
    painter = new Paint()
      ..color = Color(0xFFFFFFFF)
      ..style = PaintingStyle.fill;
  }

  // 绘制
  @override
  void paint(Canvas canvas, Size size) {
    var position = pageController.position;
    double fullExtent = (position.maxScrollExtent - position.minScrollExtent
        + position.viewportDimension);
    double pageOffset = position.extentBefore / fullExtent;

    bool left2right = dxEntry < dxTarget;
    Offset entry = new Offset(left2right ? dxEntry: dxTarget, dy);
    Offset target = new Offset(left2right ? dxTarget : dxEntry, dy);

    Path path = new Path();
    path.addArc(
        new Rect.fromCircle(center: entry, radius: radius), 0.5 * pi, 1 * pi);
    path.addRect(
        new Rect.fromLTRB(entry.dx, dy - radius, target.dx, dy + radius));
    path.addArc(
        new Rect.fromCircle(center: target, radius: radius), 1.5 * pi, 1 * pi);

    canvas.translate(size.width * pageOffset, 0.0);
    canvas.drawShadow(path, Color(0xFFfbab66), 3.0, true);
    canvas.drawPath(path, painter);

  }

  // 允许重复？
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
