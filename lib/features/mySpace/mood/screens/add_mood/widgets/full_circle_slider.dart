import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../../../../utils/constants/colors.dart';

class FullCircleSlider extends StatefulWidget {
  final double value;
  final Function(double) onChanged;
  final List<Widget> emojis;

  const FullCircleSlider({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.emojis,
  }) : super(key: key);

  @override
  _FullCircleSliderState createState() => _FullCircleSliderState();
}

class _FullCircleSliderState extends State<FullCircleSlider> {
  // Calculate the angle for the current value
  double angleForValue(double value) {
    return value * 2 * math.pi - (math.pi / 2);
  }

  // Update the value of the slider based on the touch position
  void _updateValue(Offset localPosition, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double angle = math.atan2(localPosition.dy - center.dy, localPosition.dx - center.dx) + (math.pi / 2);
    double newValue = angle / (2 * math.pi);
    if (newValue < 0) newValue += 1.0;
    if (newValue > 1) newValue -= 1.0;
    setState(() {
      widget.onChanged(newValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final Offset localPosition = renderBox.globalToLocal(details.globalPosition);
        _updateValue(localPosition, renderBox.size);
      },
      child: CustomPaint(
        painter: CircleSliderPainter(value: widget.value, emojis: widget.emojis),
        size: Size(280, 280), // Define the size of the full circle here
      ),
    );
  }
}

class CircleSliderPainter extends CustomPainter {
  final double value;
  final List<Widget> emojis;

  CircleSliderPainter({required this.value, required this.emojis});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = kBoxLight
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25;

    final handlerPaintShadow = Paint()
      ..color = kApp1.withOpacity(0.75)
      ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    final handlerPaintBorder = Paint()
      ..color = kApp1
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final handlerPaint = Paint()
      // ..color = kApp1
    ..shader = LinearGradient(
      colors: [kApp1.withOpacity(0.5), kApp1],
      begin: Alignment.topLeft,
      end: Alignment.bottomCenter,
    ).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 6), radius: size.width / 4))
      ..style = PaintingStyle.fill;

    //add border to the handlerPaint


    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw full circle
    canvas.drawCircle(center, radius, paint);

    // Calculate the angle for the current value
    final double angle = value * 2 * math.pi - (math.pi / 2);

    // Calculate the position of the handler
    final Offset handlerCenter = Offset(
      radius * math.cos(angle) + center.dx,
      radius * math.sin(angle) + center.dy,
    );
    //can be removed if performance issues are noticed
    canvas.drawCircle(handlerCenter, size.width / 15, handlerPaintShadow);
    canvas.drawCircle(handlerCenter, size.width / 15, handlerPaintBorder);

    const double emojiSize = 30.0;
    // Draw the handler circle
    canvas.drawCircle(handlerCenter, emojiSize/1.5, handlerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
