import 'package:flutter/material.dart';

class NeumorphicContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final Color shadowColor;
  final Color highlightColor;
  final double blurRadius;
  final Offset distance;
  final bool isRecessed;
  final BoxShape shape;
  final Border? border;

  const NeumorphicContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backgroundColor = const Color(0xFFE0E5EC),
    this.shadowColor = const Color(0xFFA3B1C6),
    this.highlightColor = Colors.white,
    this.blurRadius = 12.0,
    this.distance = const Offset(6.0, 6.0),
    this.isRecessed = false,
    this.shape = BoxShape.rectangle,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final radius = shape == BoxShape.circle ? null : (borderRadius ?? BorderRadius.circular(20.0));

    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: shape,
        borderRadius: radius,
        border: border,
        boxShadow: isRecessed
            ? [
                BoxShadow(
                  color: shadowColor.withValues(alpha: 0.7),
                  offset: const Offset(2, 2),
                  blurRadius: 4,
                ),
                BoxShadow(
                  color: highlightColor.withValues(alpha: 0.9),
                  offset: const Offset(-2, -2),
                  blurRadius: 4,
                ),
              ]
            : [
                BoxShadow(
                  color: shadowColor,
                  offset: distance,
                  blurRadius: blurRadius,
                ),
                BoxShadow(
                  color: highlightColor,
                  offset: -distance,
                  blurRadius: blurRadius,
                ),
              ],
      ),
      child: child,
    );
  }
}
