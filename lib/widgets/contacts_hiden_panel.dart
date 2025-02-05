import 'package:flutter/material.dart';

class ContactHidenPanel extends StatelessWidget {
  final double x;
  final double y;
  final String text;

  const ContactHidenPanel({
    super.key,
    required this.x,
    required this.y,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x-40,
      top: y-25,
      child: Container(
        color: Colors.white,
        child: Text(text),
      ),
    );
  }
}