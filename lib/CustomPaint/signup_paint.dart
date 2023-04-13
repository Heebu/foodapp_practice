import 'package:flutter/material.dart';

class SignUpPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint colorRed = Paint()..color = Colors.red;
    Paint colorOrange = Paint()..color = Colors.orange;
    canvas.drawCircle(Offset(5, size.height), 100, colorRed);
    canvas.drawCircle(Offset(size.width, size.height), 50, colorOrange);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
