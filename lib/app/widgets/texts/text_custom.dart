import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final bool alignCenter;

  const TextCustom({
    Key? key,
    required this.size,
    required this.weight,
    required this.color,
    required this.text,
    this.alignCenter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignCenter ? TextAlign.center : TextAlign.start,
      style: GoogleFonts.manrope(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
