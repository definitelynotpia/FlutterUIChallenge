import 'package:flutter/material.dart';


class BlurredCirclePainter extends CustomPainter {
  final Color color;
  final double radius;
  final Offset position;
  final double blurSigma;

  BlurredCirclePainter({
    required this.color,
    required this.radius,
    required this.position,
    required this.blurSigma,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);

    canvas.drawCircle(position, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}