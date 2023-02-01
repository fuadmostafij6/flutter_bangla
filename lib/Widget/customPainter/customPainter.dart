
import 'package:flutter/material.dart';
class MenuPainter extends CustomPainter {
  final double radius;
  final Color backgroundColor;
  final Paint backgroundPaint;

  MenuPainter({
    required this.radius,
    this.backgroundColor = Colors.white,
  }) : backgroundPaint = Paint()
    ..color = backgroundColor
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(30, 30), radius, backgroundPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}