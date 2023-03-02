import 'package:flutter/material.dart';

class BottomClipper extends CustomClipper<Path> {
  double myVal;
  BottomClipper({required this.myVal});
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..quadraticBezierTo(size.width, size.height, size.width, size.height - myVal)
      ..lineTo(myVal, size.height - myVal)
      ..quadraticBezierTo(5, size.height - myVal, 0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
