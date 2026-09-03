import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NeumorphicTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;
  final int maxLines;
  final void Function(String)? onChanged;

  const NeumorphicTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
    this.maxLines = 1,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Text(
              labelText!,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF4A5568),
              ),
            ),
          ),
        ],
        FormField<String>(
          validator: validator,
          initialValue: controller?.text,
          builder: (state) {
            final hasError = state.hasError;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E5EC),
                    borderRadius: BorderRadius.circular(18),
                    border: hasError
                        ? Border.all(
                            color: const Color(0xFFE53E3E).withValues(alpha: 0.6),
                            width: 1.5,
                          )
                        : null,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFA3B1C6),
                        offset: Offset(3, 3),
                        blurRadius: 5,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -3),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: Row(
                      children: [
                        if (prefixIcon != null) ...[
                          Icon(
                            prefixIcon,
                            color: const Color(0xFF718096),
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                        ],
                        Expanded(
                          child: TextFormField(
                            controller: controller,
                            obscureText: obscureText,
                            keyboardType: keyboardType,
                            readOnly: readOnly,
                            onTap: onTap,
                            maxLines: maxLines,
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              color: const Color(0xFF2D3748),
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: hintText,
                              hintStyle: GoogleFonts.inter(
                                fontSize: 14,
                                color: const Color(0xFFA0AEC0),
                              ),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            onChanged: (val) {
                              state.didChange(val);
                              onChanged?.call(val);
                            },
                          ),
                        ),
                        ?suffixIcon,
                      ],
                    ),
                  ),
                ),
                if (hasError) ...[
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 6.0),
                    child: Text(
                      state.errorText ?? '',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: const Color(0xFFE53E3E),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ],
    );
  }
}
