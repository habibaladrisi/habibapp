import 'package:flutter/material.dart';

class CustomContainerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.blue.shade100,
          Colors.white,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    final path = Path();
    
    // Starting point
    path.moveTo(0, size.height * 0.2);
    
    // Top left curve
    path.quadraticBezierTo(
      size.width * 0.1,
      0,
      size.width * 0.3,
      0,
    );
    
    // Top line
    path.lineTo(size.width * 0.7, 0);
    
    // Top right curve
    path.quadraticBezierTo(
      size.width * 0.9,
      0,
      size.width,
      size.height * 0.2,
    );
    
    // Right line
    path.lineTo(size.width, size.height * 0.8);
    
    // Bottom right curve
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width * 0.7,
      size.height,
    );
    
    // Bottom line
    path.lineTo(size.width * 0.3, size.height);
    
    // Bottom left curve
    path.quadraticBezierTo(
      0,
      size.height,
      0,
      size.height * 0.8,
    );
    
    // Close the path
    path.close();

    // Draw shadow
    canvas.drawPath(path, shadowPaint);
    
    // Draw container
    canvas.drawPath(path, paint);

    // Add decorative lines
    final decorPaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Top decorative curve
    final decorPath = Path();
    decorPath.moveTo(size.width * 0.1, size.height * 0.1);
    decorPath.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.2,
      size.width * 0.5,
      size.height * 0.1,
    );
    canvas.drawPath(decorPath, decorPaint);

    // Bottom decorative curve
    final decorPath2 = Path();
    decorPath2.moveTo(size.width * 0.5, size.height * 0.9);
    decorPath2.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.8,
      size.width * 0.9,
      size.height * 0.9,
    );
    canvas.drawPath(decorPath2, decorPaint);
  }

  @override
  bool shouldRepaint(CustomContainerPainter oldDelegate) => false;
}

class CustomContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    
    path.moveTo(0, size.height * 0.2);
    path.quadraticBezierTo(
      size.width * 0.1,
      0,
      size.width * 0.3,
      0,
    );
    path.lineTo(size.width * 0.7, 0);
    path.quadraticBezierTo(
      size.width * 0.9,
      0,
      size.width,
      size.height * 0.2,
    );
    path.lineTo(size.width, size.height * 0.8);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width * 0.7,
      size.height,
    );
    path.lineTo(size.width * 0.3, size.height);
    path.quadraticBezierTo(
      0,
      size.height,
      0,
      size.height * 0.8,
    );
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomContainerClipper oldClipper) => false;
}
