import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? bgColor;
  final Color? iconColor;
  final double? iconSize;
  const AppIcon(
      {Key? key,
      required this.icon,
      this.bgColor,
      this.iconColor,
      this.size,
      this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 40,
      height: size ?? 40,
      decoration: BoxDecoration(
          color: bgColor ?? AppColors.primaryIconColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20)),
      child: Icon(icon,
          color: iconColor ?? AppColors.primaryIconColor2,
          size: iconSize ?? 16),
    );
  }
}
