import 'package:flutter/material.dart';

class GradientCircularProgressIndicator extends StatelessWidget {
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;
  final double value;

  const GradientCircularProgressIndicator({
    super.key,
    required this.radius,
    required this.gradientColors,
    this.strokeWidth = 4.0,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      child: CustomPaint(
        painter: _GradientCircularProgressPainter(
          gradientColors: gradientColors,
          strokeWidth: strokeWidth,
          value: value,
        ),
      ),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  final List<Color> gradientColors;
  final double strokeWidth;
  final double value;

  _GradientCircularProgressPainter({
    required this.gradientColors,
    this.strokeWidth = 4.0,
    required this.value,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double radius = (size.width / 2) - (strokeWidth / 2);
    Offset center = Offset(size.width / 2, size.height / 2);
    Rect rect = Rect.fromCircle(center: center, radius: radius);

    Paint paint = Paint()
      ..shader = SweepGradient(
        colors: gradientColors,
        startAngle: 0.0,
        endAngle: 3.1415927 * 2,
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      -3.1415927 / 2,
      (3.1415927 * 2) * (value),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
