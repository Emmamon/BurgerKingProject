import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TriglePainter extends CustomPainter {
  var mediaSize;
  TriglePainter(this.mediaSize);
  @override
  void paint(Canvas canvas, Size size) {
    var painter = Paint();
    painter.color = Colors.red;

    var upPath = Path();
    upPath.moveTo(mediaSize.width / 3, 0);
    upPath.lineTo(mediaSize.width, 0);
    upPath.lineTo(mediaSize.width, mediaSize.height / 3);
    upPath.close();

    var downPath = Path();
    downPath.moveTo(0, (mediaSize.height / 3) * 2);
    downPath.lineTo(0, mediaSize.height);
    downPath.lineTo((mediaSize.width / 3) * 2, mediaSize.height);
    downPath.close();

    canvas.drawPath(upPath, painter);
    canvas.drawPath(downPath, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
