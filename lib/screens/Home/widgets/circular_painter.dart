import 'package:flutter/material.dart';

class ToDoPainter extends CustomPainter {
  final int completedTasks;
  final int totalTasks;
  final double radius;
  final double strokeWidth;

  ToDoPainter(
      {required this.strokeWidth,
      required this.radius,
      required this.completedTasks,
      required this.totalTasks});

  @override
  void paint(Canvas canvas, Size size) {
    const double pi = 3.14;
    final double percent =
        (totalTasks != 0) ? (completedTasks / totalTasks) * 2 * pi : 0;

    Paint paint = Paint();

    paint.color = const Color(0xFFC7AA95);
    paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;
    Offset radialPosition = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(radialPosition, radius, paint);

    Paint radialProgress = Paint();
    radialProgress.color = const Color(0xFFFF852D);
    radialProgress.strokeCap = StrokeCap.round;
    radialProgress.style = PaintingStyle.stroke;
    radialProgress.strokeWidth = strokeWidth;

    Offset arcPosition = Offset(size.width / 2, size.height / 2);

    canvas.drawArc(Rect.fromCircle(center: arcPosition, radius: radius),
        -pi / 2, percent, false, radialProgress);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
