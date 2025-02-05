import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final double radius;
  final Color foregroundColor;
  final Color backgroundColor;

  final IconData icon;
  final void Function()? onTap;


  const CustomIconButton({
    super.key,
    required this.radius,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      radius: radius,
      onTap: onTap,
      
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
        ),

        child: Icon(
          icon,
          size: radius,
          color: foregroundColor,
        ),
      ),
    );
  }
}