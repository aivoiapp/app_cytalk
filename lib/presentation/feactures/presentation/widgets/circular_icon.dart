import 'package:flutter/material.dart';
import 'package:cytall/presentation/resources/resources.dart';

class CircularIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  const CircularIcon({
    super.key,
    required this.icon,
    this.backgroundColor = AppColors.testIntroIconBackground,
    this.iconColor = AppColors.iconColor,
    this.size = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      child: Icon(
        icon,
        color: iconColor,
        size: size * 0.5, // Icono un poco más pequeño que el círculo
      ),
    );
  }
}
