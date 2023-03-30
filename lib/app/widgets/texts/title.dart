import 'package:agence_test/app/core/base/colors.dart';
import 'package:agence_test/app/core/base/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  final String text;
  final Color? color;

  const CustomTitle({
    Key? key,
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      //textAlign: TextAlign.center ,
      style: GoogleFonts.manrope(
        color: color ?? CustomColors.titleColor,
        fontSize: CustomDimensions.titleSize,
        fontWeight: CustomDimensions.titleWeight,
      ),
    );
  }
}
