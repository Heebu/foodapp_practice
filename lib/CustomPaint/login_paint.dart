import 'package:flutter/material.dart';

class BubblesPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint yellowColor = Paint()..color = Colors.orange;
    Paint pinkColor = Paint()..color = Colors.pink.shade400;
    Paint whiteColor = Paint()..color = Colors.white;
    Paint blueColor = Paint()..color = Colors.blue;
    Paint redColor = Paint()..color = Colors.red;
    Paint indigoColor = Paint()..color = Colors.indigo.shade900;
    Paint indigoLine = Paint()
      ..color = Colors.indigo.shade900
      ..strokeWidth = 90
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(Offset(10, 70), 190, yellowColor);
    canvas.drawCircle(Offset(400, 300), 80, yellowColor);
    canvas.drawCircle(Offset(240, 300), 80, whiteColor);
    //canvas.drawCircle(Offset(330, 350), 80, blueColor);
    canvas.drawCircle(Offset(350, 50), 100, pinkColor);
    canvas.drawCircle(Offset(330, 210), 80, blueColor);
    canvas.drawCircle(Offset(180, 170), 50, blueColor);

    canvas.drawCircle(Offset(0, 290), 80, redColor);
    canvas.drawCircle(Offset(85, 280), 30, indigoColor);
    canvas.drawLine(Offset(200, 10), Offset(200, 100), indigoLine);
    canvas.drawCircle(Offset(195, 100), 50, redColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
