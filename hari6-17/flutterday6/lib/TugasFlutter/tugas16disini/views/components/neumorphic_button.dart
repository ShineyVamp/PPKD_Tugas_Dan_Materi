import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NeumorphicButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String text;
  final IconData? icon;
  final bool isLoading;
  final double? width;
  final double height;
  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final Color accentColor;
  final bool isSecondary;

  const NeumorphicButton({
    super.key,
    required this.onTap,
    required this.text,
    this.icon,
    this.isLoading = false,
    this.width,
    this.height = 54.0,
    this.borderRadius,
    this.backgroundColor = const Color(0xFFE0E5EC),
    this.textColor = const Color(0xFF0040E0),
    this.accentColor = const Color(0xFF0040E0),
    this.isSecondary = false,
  });

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final effectiveRadius = widget.borderRadius ?? BorderRadius.circular(28.0);
    final isEnabled = widget.onTap != null && !widget.isLoading;

    return GestureDetector(
      onTapDown: isEnabled ? (_) => setState(() => _isPressed = true) : null,
      onTapUp: isEnabled
          ? (_) {
              setState(() => _isPressed = false);
              widget.onTap?.call();
            }
          : null,
      onTapCancel: isEnabled ? () => setState(() => _isPressed = false) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: effectiveRadius,
          boxShadow: _isPressed
              ? [
                  const BoxShadow(
                    color: Color(0xFFA3B1C6),
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-2, -2),
                    blurRadius: 4,
                  ),
                ]
              : [
                  const BoxShadow(
                    color: Color(0xFFA3B1C6),
                    offset: Offset(6, 6),
                    blurRadius: 10,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-6, -6),
                    blurRadius: 10,
                  ),
                ],
        ),
        child: Center(
          child: widget.isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: widget.accentColor,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.icon != null) ...[
                      Icon(
                        widget.icon,
                        color: widget.isSecondary
                            ? const Color(0xFF556070)
                            : widget.accentColor,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                    ],
                    Text(
                      widget.text,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: widget.isSecondary
                            ? const Color(0xFF556070)
                            : widget.textColor,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
