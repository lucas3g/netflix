import 'package:flutter/material.dart';

class MyCustomPaintWidget extends StatefulWidget {
  const MyCustomPaintWidget({super.key});

  @override
  State<MyCustomPaintWidget> createState() => _MyCustomPaintWidgetState();
}

class _MyCustomPaintWidgetState extends State<MyCustomPaintWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.red.withOpacity(0.1);

    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width * 0.2, 0);
    path.lineTo(0, size.height * 0.4);
    path.close();

    canvas.drawPath(
      path,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
